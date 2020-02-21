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
    name = "linked_hash_map",
    crate_root = "src/lib.rs",
    crate_type = "lib",
    edition = "2015",
    srcs = glob(["**/*.rs"]),
    deps = [
        "@raze__serde__0_8_23//:serde",
        "@raze__serde_test__0_8_23//:serde_test",
    ],
    rustc_flags = [
        "--cap-lints=allow",
    ],
    version = "0.3.0",
    crate_features = [
        "serde",
        "serde_impl",
        "serde_test",
    ],
)

# Unsupported target "serde" with type "test" omitted
# Unsupported target "test" with type "test" omitted
