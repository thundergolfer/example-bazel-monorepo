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
    name = "serde_urlencoded",
    crate_root = "src/lib.rs",
    crate_type = "lib",
    edition = "2015",
    srcs = glob(["**/*.rs"]),
    deps = [
        "@raze__dtoa__0_4_5//:dtoa",
        "@raze__itoa__0_4_5//:itoa",
        "@raze__serde__1_0_104//:serde",
        "@raze__url__1_7_2//:url",
    ],
    rustc_flags = [
        "--cap-lints=allow",
    ],
    version = "0.5.5",
    crate_features = [
    ],
)

# Unsupported target "test_deserialize" with type "test" omitted
# Unsupported target "test_serialize" with type "test" omitted
