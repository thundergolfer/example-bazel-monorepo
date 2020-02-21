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


# Unsupported target "dump_yaml" with type "example" omitted
# Unsupported target "quickcheck" with type "test" omitted
# Unsupported target "spec_test" with type "test" omitted
# Unsupported target "test_round_trip" with type "test" omitted

rust_library(
    name = "yaml_rust",
    crate_root = "src/lib.rs",
    crate_type = "lib",
    edition = "2015",
    srcs = glob(["**/*.rs"]),
    deps = [
        "@raze__linked_hash_map__0_5_2//:linked_hash_map",
    ],
    rustc_flags = [
        "--cap-lints=allow",
    ],
    version = "0.4.3",
    crate_features = [
    ],
)

