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



rust_library(
    name = "blake2b_simd",
    crate_root = "src/lib.rs",
    crate_type = "lib",
    edition = "2018",
    srcs = glob(["**/*.rs"]),
    deps = [
        "@raze__arrayref__0_3_6//:arrayref",
        "@raze__arrayvec__0_5_1//:arrayvec",
        "@raze__constant_time_eq__0_1_5//:constant_time_eq",
    ],
    rustc_flags = [
        "--cap-lints=allow",
    ],
    version = "0.5.10",
    crate_features = [
        "default",
        "std",
    ],
)

