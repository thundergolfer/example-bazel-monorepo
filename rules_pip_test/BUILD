load("@rules_python//python:python.bzl", "py_library")
load("@rules_pip_deps//:requirements.bzl", "requirement")

PY_DEPS = [
    requirement("azure-common"),
    requirement("azure-storage-blob"),
    requirement("snowflake-connector-python"),
    requirement("click"),
]

py_binary(
    name = "main",
    srcs = ["main.py"],
    imports = ["."],
    main = "main.py",
    python_version = "PY3",
    srcs_version = "PY3",
    deps = PY_DEPS,
)
