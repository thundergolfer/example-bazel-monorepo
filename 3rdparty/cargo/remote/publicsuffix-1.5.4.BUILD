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


# Unsupported target "bench" with type "bench" omitted

rust_library(
    name = "publicsuffix",
    crate_root = "src/lib.rs",
    crate_type = "lib",
    edition = "2015",
    srcs = glob(["**/*.rs"]),
    deps = [
        "@raze__error_chain__0_12_2//:error_chain",
        "@raze__idna__0_2_0//:idna",
        "@raze__lazy_static__1_4_0//:lazy_static",
        "@raze__regex__1_3_4//:regex",
        "@raze__url__2_1_1//:url",
    ],
    rustc_flags = [
        "--cap-lints=allow",
    ],
    version = "1.5.4",
    crate_features = [
    ],
)

