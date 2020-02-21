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
  "notice", # "MIT"
])

load(
    "@io_bazel_rules_rust//rust:rust.bzl",
    "rust_library",
    "rust_binary",
    "rust_test",
)



rust_library(
    name = "synstructure",
    crate_root = "src/lib.rs",
    crate_type = "lib",
    edition = "2018",
    srcs = glob(["**/*.rs"]),
    deps = [
        "@raze__proc_macro2__1_0_8//:proc_macro2",
        "@raze__quote__1_0_2//:quote",
        "@raze__syn__1_0_14//:syn",
        "@raze__unicode_xid__0_2_0//:unicode_xid",
    ],
    rustc_flags = [
        "--cap-lints=allow",
    ],
    version = "0.12.3",
    crate_features = [
        "default",
        "proc-macro",
    ],
)

