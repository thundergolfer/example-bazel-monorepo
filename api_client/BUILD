load("@py_deps//:requirements.bzl", "requirement")
load("//tools/python/interpreter:macro.bzl", "py_interpreter")

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
    deps = [
        requirement("requests"),
    ],
    main = "py_antilibrary/__init__.py"
)

py_interpreter(
    name = "repl",
    deps = [":nyt_bestsellers"],
)

# TODO(Jonathon): Figure out how to use Bazel to distribute this client to PyPi
