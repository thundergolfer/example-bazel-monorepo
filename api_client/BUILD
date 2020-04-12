load("@py_deps//:requirements.bzl", "requirement")
load("@graknlabs_bazel_distribution//pip:rules.bzl", "assemble_pip", "deploy_pip")
load("//tools/python/interpreter:macro.bzl", "py_interpreter")

exports_files(["README.md", "deployment.properties"])

py_library(
    name = "api_client",
    srcs = glob(["py_antilibrary/**/*.py"]),
    deps = [
        requirement("requests"),
    ],
)

py_binary(
    name = "test_run",
    srcs = glob(["py_antilibrary/**/*.py"]),
    main = "py_antilibrary/__init__.py",
    deps = [
        requirement("requests"),
    ],
)

py_interpreter(
    name = "repl",
    deps = [":api_client"],
)

assemble_pip(
    name = "assemble-pip",
    target = ":api_client",
    package_name = "py-antilibrary",
    classifiers = [
        "Programming Language :: Python",
        "Programming Language :: Python :: 3.5",
        "Programming Language :: Python :: 3.6",
        "Programming Language :: Python :: 3.7",
        "Programming Language :: Python :: 3.8",
        "License :: OSI Approved :: MIT License",
        "Intended Audience :: Developers",
        "Environment :: Console",
    ],
    url = "https://github.com/thundergolfer/example-bazel-monorepo/",
    author = "Jonathon Belotti",
    author_email = "jonathon.i.belotti@gmail.com",
    license = "MIT",
    # TODO(Jonathon): This rule should support automatic construction of this array
    # Ref: https://github.com/graknlabs/bazel-distribution/issues/223
    install_requires=[
        'requests~=2.23.0',
    ],
    keywords = ["antilibrary", "apiwrapper", "apiclient", "demo"],
    description = "API Client for antilibrary.xyz, a demo app for thundergolfer/example-bazel-monorepo",
    long_description_file = "//api_client:README.md",
)

# 1. Set DEPLOY_PIP_USERNAME and DEPLOY_PIP_PASSWORD environment variables
# 2. Run `bazel run //api_client:deploy-pip -- repository`
deploy_pip(
    name = "deploy-pip",
    target = ":assemble-pip",
    deployment_properties = ":deployment.properties",
)
