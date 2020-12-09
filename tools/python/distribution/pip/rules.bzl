#
# Licensed to the Apache Software Foundation (ASF) under one
# or more contributor license agreements.  See the NOTICE file
# distributed with this work for additional information
# regarding copyright ownership.  The ASF licenses this file
# to you under the Apache License, Version 2.0 (the
# "License"); you may not use this file except in compliance
# with the License.  You may obtain a copy of the License at
#
#   http://www.apache.org/licenses/LICENSE-2.0
#
# Unless required by applicable law or agreed to in writing,
# software distributed under the License is distributed on an
# "AS IS" BASIS, WITHOUT WARRANTIES OR CONDITIONS OF ANY
# KIND, either express or implied.  See the License for the
# specific language governing permissions and limitations
# under the License.
#

#load("@graknlabs_bazel_distribution_pip//:requirements.bzl", graknlabs_bazel_distribution_requirement = "requirement")
load("@py_deps//:requirements.bzl", "requirement")


def _python_repackage_impl(ctx):
    outputs = []
    actions = []
    all_packages = []
    for file in ctx.files.src:
        path = file.short_path

        if path.startswith('../'):
            # when built from a foreign workspace,
            # filename starts with ../<workspace_name>/
            path = path.replace(
                '../{}/'.format(ctx.attr.src.label.workspace_name),
                ''
            )

        # trim bazel package and target name
        path = path.replace(
            '{}/{}/'.format(ctx.attr.src.label.package, ctx.attr.src.label.name),
            ''
        )

        # add original package root
        all_packages.append(path.split('/')[0])

        # prepend Python package folder
        path = '{}/{}'.format(ctx.attr.package, path)

        actions.append({
            'file': file,
            'output_path': path,
        })

    for action in actions:
        args = ctx.actions.args()
        outputFile = ctx.actions.declare_file(action['output_path'])

        args.add('--src', action['file'].path)
        args.add('--dest', outputFile.path)
        args.add('--pkg', ctx.attr.package)
        args.add_all('--all_pkgs', all_packages)

        ctx.actions.run(
            inputs = [action['file']],
            outputs = [outputFile],
            arguments = [args],
            executable = ctx.executable._repackage_script
        )
        outputs.append(outputFile)

    return DefaultInfo(files = depset(outputs))


PyDeploymentInfo = provider(
    fields = {
        'package': 'package to deploy',
        'version_file': 'file with package version'
    }
)


def _assemble_pip_impl(ctx):
    args = ctx.actions.args()

    python_source_files = []

    imports = []
    for j in ctx.attr.target[PyInfo].imports.to_list():
        if 'pypi' not in j:
            imports.append(j)

    for i in ctx.attr.target[PyInfo].transitive_sources.to_list():
        if 'pypi' not in i.path and 'external' not in i.path:
            python_source_files.append(i)

    args.add_all('--files', python_source_files)
    args.add('--output', ctx.outputs.pip_package.path)
    args.add('--readme', ctx.file.long_description_file.path)

    # Final 'setup.py' is generated in 2 steps
    setup_py = ctx.actions.declare_file("setup.py")
    preprocessed_setup_py = ctx.actions.declare_file("_setup.py")

    # Step 1: fill in everything except version
    ctx.actions.expand_template(
      template = ctx.file._setup_py_template,
      output = preprocessed_setup_py,
      substitutions = {
          "{name}": ctx.attr.package_name,
          "{description}": ctx.attr.description,
          "{classifiers}": str(ctx.attr.classifiers),
          "{keywords}": " ".join(ctx.attr.keywords),
          "{url}": ctx.attr.url,
          "{author}": ctx.attr.author,
          "{author_email}": ctx.attr.author_email,
          "{license}": ctx.attr.license,
          "{install_requires}": str(ctx.attr.install_requires),
          "{long_description_file}": ctx.file.long_description_file.path
      },
    )

    if not ctx.attr.version_file:
        version_file = ctx.actions.declare_file(ctx.attr.name + "__do_not_reference.version")
        version = ctx.var.get('version', '0.0.0')

        if len(version) == 40:
            # this is a commit SHA, most likely
            version = "0.0.0-{}".format(version)

        ctx.actions.run_shell(
            inputs = [],
            outputs = [version_file],
            command = "echo {} > {}".format(version, version_file.path)
        )
    else:
        version_file = ctx.file.version_file

    # Step 2: fill in {pip_version} from version_file
    ctx.actions.run_shell(
      inputs = [preprocessed_setup_py, version_file],
      outputs = [setup_py],
      command = "VERSION=`cat %s` && sed -e s/{version}/$VERSION/g %s > %s" % (
          version_file.path, preprocessed_setup_py.path, setup_py.path)
    )

    args.add("--setup_py", setup_py.path)
    args.add_all("--imports", imports)

    ctx.actions.run(
        inputs = [version_file, setup_py, ctx.file.long_description_file] + python_source_files,
        outputs = [ctx.outputs.pip_package],
        arguments = [args],
        executable = ctx.executable._assemble_script,
    )

    return [PyDeploymentInfo(package=ctx.outputs.pip_package, version_file=version_file)]


def _deploy_pip_impl(ctx):
    deployment_script = ctx.actions.declare_file("{}_deploy.py".format(ctx.attr.name))

    ctx.actions.expand_template(
        template = ctx.file._deploy_py_template,
        output = deployment_script,
        is_executable = True,
        substitutions = {
            "{package_file}": ctx.attr.target[PyDeploymentInfo].package.short_path,
            "{version_file}": ctx.attr.target[PyDeploymentInfo].version_file.short_path,
            "{snapshot}": ctx.attr.snapshot,
            "{release}": ctx.attr.release,
        }
    )

    all_python_files = []
    for dep in ctx.attr._deps:
        all_python_files.extend(dep.data_runfiles.files.to_list())
        all_python_files.extend(dep.default_runfiles.files.to_list())

    return DefaultInfo(
        executable = deployment_script,
        runfiles = ctx.runfiles(
                files=[ctx.attr.target[PyDeploymentInfo].package, ctx.attr.target[PyDeploymentInfo].version_file] + all_python_files
            )
        )


python_repackage = rule(
    attrs = {
        "src": attr.label(
            mandatory = True,
            doc = "Python source files"
        ),
        "package": attr.string(
            mandatory = True,
            doc = "New package root for files to be put in"
        ),
        "_repackage_script": attr.label(
            default = "//tools/python/distribution/pip:repackage",
            executable = True,
            cfg = "host"
        )

    },
    implementation = _python_repackage_impl,
)


assemble_pip = rule(
    attrs = {
         "target": attr.label(
            mandatory = True,
            doc = "`py_library` label to be included in the package",
        ),
        "version_file": attr.label(
            allow_single_file = True,
            doc = """
            File containing version string.
            Alternatively, pass --define version=VERSION to Bazel invocation.
            Not specifying version at all defaults to '0.0.0'
            """
        ),
        "package_name": attr.string(
            mandatory = True,
            doc = "A string with Python pip package name"
        ),
        "description": attr.string(
            mandatory = True,
            doc="A string with the short description of the package",
        ),
        "long_description_file": attr.label(
            allow_single_file = True,
            mandatory = True,
            doc = "A label with the long description of the package. Usually a README or README.rst file"
        ),
        "classifiers": attr.string_list(
            mandatory = True,
            doc = "A list of strings, containing Python package classifiers"
        ),
        "keywords": attr.string_list(
            mandatory = True,
            doc = "A list of strings, containing keywords"
        ),
        "url": attr.string(
            mandatory = True,
            doc = "A homepage for the project"
        ),
        "author": attr.string(
            mandatory = True,
            doc = "Details about the author"
        ),
        "author_email": attr.string(
            mandatory = True,
            doc = "The email for the author"
        ),
        "license": attr.string(
            mandatory = True,
            doc = "The type of license to use"
        ),
        "install_requires": attr.string_list(
            mandatory = True,
            doc = "A list of strings which are names of required packages for this one"
        ),
        "_setup_py_template": attr.label(
            allow_single_file = True,
            default = "//tools/python/distribution/pip/templates:new_setup.py",
        ),
        "_assemble_script": attr.label(
            default = "//tools/python/distribution/pip:assemble",
            executable = True,
            cfg = "host"
        )
    },
    implementation = _assemble_pip_impl,
    outputs = {
        "pip_package": "%{package_name}.tar.gz",
    },
)


deploy_pip = rule(
    attrs = {
        "target": attr.label(
            mandatory = True,
            allow_single_file = [".tar.gz"],
            providers = [PyDeploymentInfo],
            doc = "`assemble_pip` label to be included in the package",
        ),
        "snapshot": attr.string(
            mandatory = True,
            doc = "Remote repository to deploy pip snapshot to"
        ),
        "release": attr.string(
            mandatory = True,
            doc = "Remote repository to deploy pip release to"
        ),
        "_deploy_py_template": attr.label(
            allow_single_file = True,
            default = "//tools/python/distribution/pip/templates:deploy.py",
        ),
        "_deps": attr.label_list(
            default = [
                requirement("twine"),
                requirement("setuptools"),
#                graknlabs_bazel_distribution_requirement("twine"),
#                graknlabs_bazel_distribution_requirement("setuptools"),
#                graknlabs_bazel_distribution_requirement("wheel"),
#                graknlabs_bazel_distribution_requirement("requests"),
#                graknlabs_bazel_distribution_requirement("urllib3"),
#                graknlabs_bazel_distribution_requirement("chardet"),
#                graknlabs_bazel_distribution_requirement("certifi"),
#                graknlabs_bazel_distribution_requirement("idna"),
#                graknlabs_bazel_distribution_requirement("tqdm"),
#                graknlabs_bazel_distribution_requirement("requests_toolbelt"),
#                graknlabs_bazel_distribution_requirement("pkginfo"),
#                graknlabs_bazel_distribution_requirement("readme_renderer"),
#                graknlabs_bazel_distribution_requirement("Pygments"),
#                graknlabs_bazel_distribution_requirement("docutils"),
#                graknlabs_bazel_distribution_requirement("bleach"),
#                graknlabs_bazel_distribution_requirement("webencodings")
            ]
        )
    },
    executable = True,
    implementation = _deploy_pip_impl
)
