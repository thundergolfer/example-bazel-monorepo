load("@py_deps//:requirements.bzl", "requirement")

py_binary(
    name = "bazel_adoption_analysis",
    srcs = glob(["*.py"]),
    main = "main.py",
    deps = [
        requirement("beautifulsoup4"),
        requirement("loguru"),
        requirement("requests"),
    ],
)