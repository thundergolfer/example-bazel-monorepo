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


# Unsupported target "ui" with type "test" omitted

rust_library(
    name = "wasm_bindgen_macro",
    crate_root = "src/lib.rs",
    crate_type = "proc-macro",
    edition = "2018",
    srcs = glob(["**/*.rs"]),
    deps = [
        "@raze__quote__1_0_2//:quote",
        "@raze__wasm_bindgen_macro_support__0_2_58//:wasm_bindgen_macro_support",
    ],
    rustc_flags = [
        "--cap-lints=allow",
    ],
    version = "0.2.58",
    crate_features = [
        "spans",
    ],
)

