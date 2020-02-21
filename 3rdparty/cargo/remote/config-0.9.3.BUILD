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
    name = "config",
    crate_root = "src/lib.rs",
    crate_type = "lib",
    edition = "2015",
    srcs = glob(["**/*.rs"]),
    deps = [
        "@raze__lazy_static__1_4_0//:lazy_static",
        "@raze__nom__4_2_3//:nom",
        "@raze__rust_ini__0_13_0//:rust_ini",
        "@raze__serde__1_0_104//:serde",
        "@raze__serde_hjson__0_8_2//:serde_hjson",
        "@raze__serde_json__1_0_48//:serde_json",
        "@raze__toml__0_4_10//:toml",
        "@raze__yaml_rust__0_4_3//:yaml_rust",
    ],
    rustc_flags = [
        "--cap-lints=allow",
    ],
    version = "0.9.3",
    crate_features = [
        "default",
        "hjson",
        "ini",
        "json",
        "rust-ini",
        "serde-hjson",
        "serde_json",
        "toml",
        "yaml",
        "yaml-rust",
    ],
)

# Unsupported target "datetime" with type "test" omitted
# Unsupported target "defaults" with type "test" omitted
# Unsupported target "empty" with type "test" omitted
# Unsupported target "env" with type "test" omitted
# Unsupported target "errors" with type "test" omitted
# Unsupported target "file" with type "test" omitted
# Unsupported target "file_hjson" with type "test" omitted
# Unsupported target "file_ini" with type "test" omitted
# Unsupported target "file_json" with type "test" omitted
# Unsupported target "file_toml" with type "test" omitted
# Unsupported target "file_yaml" with type "test" omitted
# Unsupported target "get" with type "test" omitted
# Unsupported target "merge" with type "test" omitted
# Unsupported target "set" with type "test" omitted
