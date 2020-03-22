load("@io_bazel_rules_rust//rust:rust.bzl", "rust_binary")

rust_binary(
    name = "hello_world",
    srcs = ["src/hello.rs"],
    deps = [
        "//3rdparty/cargo:rand",
    ],
)
