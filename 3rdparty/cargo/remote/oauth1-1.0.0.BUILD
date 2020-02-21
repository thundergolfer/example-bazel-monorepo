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
    name = "oauth1",
    crate_root = "src/lib.rs",
    crate_type = "lib",
    edition = "2018",
    srcs = glob(["**/*.rs"]),
    deps = [
        "@raze__base64__0_11_0//:base64",
        "@raze__percent_encoding__2_1_0//:percent_encoding",
        "@raze__rand__0_7_3//:rand",
        "@raze__ring__0_16_11//:ring",
        "@raze__time__0_2_6//:time",
    ],
    rustc_flags = [
        "--cap-lints=allow",
    ],
    version = "1.0.0",
    crate_features = [
    ],
)

