load("@io_bazel_rules_rust//rust:rust.bzl", "rust_library")

rust_library(
    name = "goodreads_sh",
    srcs = glob(["src/*.rs"]),
    deps = [
        "//3rdparty/cargo:base64",
        "//3rdparty/cargo:config",
        "//3rdparty/cargo:dirs",
        "//3rdparty/cargo:oauth1",
        "//3rdparty/cargo:oauth_client",
        "//3rdparty/cargo:rand",
        "//3rdparty/cargo:regex",
        "//3rdparty/cargo:reqwest",
        "//3rdparty/cargo:roxmltree",
        "//3rdparty/cargo:serde",
        "//3rdparty/cargo:simple_error",
        "//3rdparty/cargo:structopt",
        "//3rdparty/cargo:termcolor",
        "//3rdparty/cargo:toml",
        "//3rdparty/cargo:url",
    ],
)
