load("@py_deps//:requirements.bzl", "requirement")

MAIN_SRCS = glob(["*.py"])

MAIN_DEPS = [
    requirement("click"),
]

py_binary(
    name = "main",
    srcs = ["main.py"],
    imports = [""],
    main = "main.py",
    python_version = "PY3",
    srcs_version = "PY3",
    deps = MAIN_DEPS,
)
