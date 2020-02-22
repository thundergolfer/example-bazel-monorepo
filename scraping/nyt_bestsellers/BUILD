load("@py_deps//:requirements.bzl", "requirement")

py_binary(
    name = "nyt_bestsellers",
    srcs = ["main.py"],
    main = "main.py",
    deps = [
        requirement("requests"),
        requirement("beautifulsoup4"),
    ],
)
