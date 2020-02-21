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


# Unsupported target "decode" with type "example" omitted
# Unsupported target "enum_external" with type "example" omitted
# Unsupported target "enum_external_deserialize" with type "test" omitted

rust_library(
    name = "toml",
    crate_root = "src/lib.rs",
    crate_type = "lib",
    edition = "2015",
    srcs = glob(["**/*.rs"]),
    deps = [
        "@raze__serde__1_0_104//:serde",
    ],
    rustc_flags = [
        "--cap-lints=allow",
    ],
    version = "0.4.10",
    crate_features = [
    ],
)

# Unsupported target "toml2json" with type "example" omitted
