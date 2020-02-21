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
    name = "wasm_bindgen_backend",
    crate_root = "src/lib.rs",
    crate_type = "lib",
    edition = "2018",
    srcs = glob(["**/*.rs"]),
    deps = [
        "@raze__bumpalo__3_2_0//:bumpalo",
        "@raze__lazy_static__1_4_0//:lazy_static",
        "@raze__log__0_4_8//:log",
        "@raze__proc_macro2__1_0_8//:proc_macro2",
        "@raze__quote__1_0_2//:quote",
        "@raze__syn__1_0_14//:syn",
        "@raze__wasm_bindgen_shared__0_2_58//:wasm_bindgen_shared",
    ],
    rustc_flags = [
        "--cap-lints=allow",
    ],
    version = "0.2.58",
    crate_features = [
        "spans",
    ],
)

