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
  "notice", # "MIT,Apache-2.0"
])

load(
    "@io_bazel_rules_rust//rust:rust.bzl",
    "rust_library",
    "rust_binary",
    "rust_test",
)



rust_library(
    name = "serde_json",
    crate_root = "src/lib.rs",
    crate_type = "lib",
    edition = "2015",
    srcs = glob(["**/*.rs"]),
    deps = [
        "@raze__dtoa__0_4_5//:dtoa",
        "@raze__itoa__0_3_4//:itoa",
        "@raze__num_traits__0_1_43//:num_traits",
        "@raze__serde__0_9_15//:serde",
    ],
    rustc_flags = [
        "--cap-lints=allow",
    ],
    version = "0.9.10",
    crate_features = [
    ],
)

