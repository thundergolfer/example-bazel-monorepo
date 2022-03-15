load("@rules_python//python:python.bzl", "py_binary")
load("@py_deps//:requirements.bzl", "all_requirements")

# A Python interpreter (or REPL) with the monorepo's Python dependencies all available.
py_binary(
    name = "interpreter",
    srcs = ["interpreter.py"],
    visibility = ["//visibility:public"],
    deps = all_requirements,
)

exports_files(["interpreter.py"])
