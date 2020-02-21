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
    name = "serde_hjson",
    crate_root = "src/lib.rs",
    crate_type = "lib",
    edition = "2015",
    srcs = glob(["**/*.rs"]),
    deps = [
        "@raze__lazy_static__0_2_11//:lazy_static",
        "@raze__linked_hash_map__0_3_0//:linked_hash_map",
        "@raze__num_traits__0_1_43//:num_traits",
        "@raze__regex__1_3_4//:regex",
        "@raze__serde__0_8_23//:serde",
    ],
    rustc_flags = [
        "--cap-lints=allow",
    ],
    version = "0.8.2",
    crate_features = [
        "default",
        "linked-hash-map",
        "preserve_order",
    ],
)

