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
  "restricted", # "MIT OR Apache-2.0"
])

load(
    "@io_bazel_rules_rust//rust:rust.bzl",
    "rust_library",
    "rust_binary",
    "rust_test",
)



rust_library(
    name = "oauth_client",
    crate_root = "src/lib.rs",
    crate_type = "lib",
    edition = "2015",
    srcs = glob(["**/*.rs"]),
    deps = [
        "@raze__base64__0_5_2//:base64",
        "@raze__error_chain__0_10_0//:error_chain",
        "@raze__log__0_3_9//:log",
        "@raze__rand__0_3_23//:rand",
        "@raze__reqwest__0_5_2//:reqwest",
        "@raze__rust_crypto__0_2_36//:rust_crypto",
        "@raze__time__0_1_42//:time",
        "@raze__url__1_7_2//:url",
    ],
    rustc_flags = [
        "--cap-lints=allow",
    ],
    version = "0.3.2",
    crate_features = [
    ],
)

# Unsupported target "test_authorization_header" with type "example" omitted
# Unsupported target "test_get" with type "example" omitted
# Unsupported target "test_post" with type "example" omitted
