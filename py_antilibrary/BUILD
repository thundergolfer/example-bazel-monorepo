load("@py_deps//:requirements.bzl", "requirement")
load("@graknlabs_bazel_distribution//pip:rules.bzl", "assemble_pip", "deploy_pip")
load("//tools/python/interpreter:macro.bzl", "py_interpreter")

exports_files([
    "README.md",
    "deployment.properties",
    "pypi-version.txt",
])

py_library(
    name = "py_antilibrary",
    srcs = glob(["__init__.py"]),
    deps = [
        requirement("requests"),
    ],
)

py_binary(
    name = "test_run",
    srcs = glob(["__init__.py"]),
    main = "__init__.py",
    deps = [
        requirement("requests"),
    ],
)

py_interpreter(
    name = "repl",
    deps = [":py_antilibrary"],
)

# TODO(Jonathon): This rule should support specifying the top-level package.
# If py_antilibrary wasn't top-level in the repo and instead lived under 'xxx', then
# users of the package would have to import it like `import xxx.py_antilibrary`. Not ideal.
assemble_pip(
    name = "assemble-pip",
    package_name = "py-antilibrary",
    author = "Jonathon Belotti",
    author_email = "jonathon.i.belotti@gmail.com",
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
    description = "API Client for antilibrary.xyz, a demo app for thundergolfer/example-bazel-monorepo",
    keywords = [
        "antilibrary",
        "apiwrapper",
        "apiclient",
        "demo",
    ],
    license = "MIT",
    long_description_file = "//py_antilibrary:README.md",
    requirements_file = ":pkg_requirements.txt",
    tags = ["manual"],
    target = ":py_antilibrary",
    url = "https://github.com/thundergolfer/example-bazel-monorepo/",
    version_file = "pypi-version.txt",
)

# 1. Set DEPLOY_PIP_USERNAME and DEPLOY_PIP_PASSWORD environment variables
# 2. Run `bazel run //py_antilibrary:deploy-pip -- repository`
deploy_pip(
    name = "deploy-pip",
    release = "https://upload.pypi.org/legacy/",
    snapshot = "https://test.pypi.org/legacy/",
    tags = ["manual"],
    target = ":assemble-pip",
)
