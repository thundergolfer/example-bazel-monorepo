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
  "restricted", # "Apache-2.0 OR MIT"
])

load(
    "@io_bazel_rules_rust//rust:rust.bzl",
    "rust_library",
    "rust_binary",
    "rust_test",
)


# Unsupported target "format_str" with type "bench" omitted
# Unsupported target "invalid_parse_str" with type "bench" omitted
# Unsupported target "mod" with type "bench" omitted
# Unsupported target "serde_support" with type "bench" omitted

rust_library(
    name = "uuid",
    crate_root = "src/lib.rs",
    crate_type = "lib",
    edition = "2015",
    srcs = glob(["**/*.rs"]),
    deps = [
        "@raze__rand__0_6_5//:rand",
    ],
    rustc_flags = [
        "--cap-lints=allow",
    ],
    version = "0.7.4",
    crate_features = [
        "default",
        "rand",
        "std",
        "v4",
    ],
)

# Unsupported target "valid_parse_str" with type "bench" omitted
