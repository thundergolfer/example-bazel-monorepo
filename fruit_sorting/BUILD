MAIN_SRCS = glob(["*.py"])

MAIN_DEPS = [
    "//3rdparty/python:click"
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
