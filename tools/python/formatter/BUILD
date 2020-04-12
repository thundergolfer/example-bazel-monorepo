load("@py_deps//:requirements.bzl", "requirement")

# NOTE: Can't be run in bazel-linting-system as 'cfg = host'.
# "AssertionError: Cannot find .runfiles directory for bazel-out/host/bin/tools/python/formatter/formatter"
# Maybe a par_binary would work?
py_binary(
    name = "formatter",
    srcs = ["formatter.py"],
    visibility = ["//tools/linting:__subpackages__"],
    deps = [
        requirement("black"),
    ],
)
