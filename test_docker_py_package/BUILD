load("@py_deps//:requirements.bzl", "requirement")

py_binary(
    name = "test",
    srcs = glob(["*.py"]),
    imports = [""],
    main = "main.py",
    deps = [
        requirement("docker"),
    ],
    python_version = "PY3",
    srcs_version = "PY3",
)