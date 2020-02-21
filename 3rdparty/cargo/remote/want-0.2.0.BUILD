"""
cargo-raze crate build file.

DO NOT EDIT! Replaced on runs of cargo-raze
"""
package(default_visibility = [
  # Public for visibility by "@raze__crate__version//" targets.
  #
  # Prefer access through "//3rdparty/cargo", which limits external
  # visibility to explicit Cargo.toml dependencies.
  "//visibility:public",
])

licenses([
  "notice", # "MIT"
])

load(
    "@io_bazel_rules_rust//rust:rust.bzl",
    "rust_library",
    "rust_binary",
    "rust_test",
)


# Unsupported target "throughput" with type "bench" omitted

rust_library(
    name = "want",
    crate_root = "src/lib.rs",
    crate_type = "lib",
    edition = "2015",
    srcs = glob(["**/*.rs"]),
    deps = [
        "@raze__futures__0_1_29//:futures",
        "@raze__log__0_4_8//:log",
        "@raze__try_lock__0_2_2//:try_lock",
    ],
    rustc_flags = [
        "--cap-lints=allow",
    ],
    version = "0.2.0",
    crate_features = [
    ],
)

