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


alias(
  name = "rust_argon2",
  actual = ":argon2",
)

rust_library(
    name = "argon2",
    crate_root = "src/lib.rs",
    crate_type = "lib",
    edition = "2018",
    srcs = glob(["**/*.rs"]),
    deps = [
        "@raze__base64__0_11_0//:base64",
        "@raze__blake2b_simd__0_5_10//:blake2b_simd",
        "@raze__constant_time_eq__0_1_5//:constant_time_eq",
        "@raze__crossbeam_utils__0_7_0//:crossbeam_utils",
    ],
    rustc_flags = [
        "--cap-lints=allow",
    ],
    version = "0.7.0",
    crate_features = [
    ],
)

# Unsupported target "integration_test" with type "test" omitted
