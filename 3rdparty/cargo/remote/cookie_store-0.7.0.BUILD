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
    name = "cookie_store",
    crate_root = "src/lib.rs",
    crate_type = "lib",
    edition = "2018",
    srcs = glob(["**/*.rs"]),
    deps = [
        "@raze__cookie__0_12_0//:cookie",
        "@raze__failure__0_1_6//:failure",
        "@raze__idna__0_1_5//:idna",
        "@raze__log__0_4_8//:log",
        "@raze__publicsuffix__1_5_4//:publicsuffix",
        "@raze__serde__1_0_104//:serde",
        "@raze__serde_json__1_0_48//:serde_json",
        "@raze__time__0_1_42//:time",
        "@raze__try_from__0_3_2//:try_from",
        "@raze__url__1_7_2//:url",
    ],
    rustc_flags = [
        "--cap-lints=allow",
    ],
    version = "0.7.0",
    crate_features = [
    ],
)

