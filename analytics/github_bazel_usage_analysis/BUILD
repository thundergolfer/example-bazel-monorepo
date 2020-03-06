load("@py_deps//:requirements.bzl", "requirement")

py_binary(
    name = "github_bazel_usage_analysis",
    srcs = glob(["*.py"]),
    main = "main.py",
    deps = [
        requirement("click"),
        requirement("loguru"),
        requirement("requests"),
    ],
)
