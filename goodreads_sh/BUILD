load("@io_bazel_rules_rust//rust:rust.bzl", "rust_library")

rust_library(
    name = "goodreads_sh",
    srcs = glob(["src/*.rs"]),
    deps = [
        "//3rdparty/cargo:config",
        "//3rdparty/cargo:oauth1",
        "//3rdparty/cargo:reqwest",
        "//3rdparty/cargo:serde",
        "//3rdparty/cargo:simple_error",
        "//3rdparty/cargo:structopt",
        "//3rdparty/cargo:termcolor",
    ]
)