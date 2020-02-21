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
    name = "hyper",
    crate_root = "src/lib.rs",
    crate_type = "lib",
    edition = "2015",
    srcs = glob(["**/*.rs"]),
    deps = [
        "@raze__base64__0_9_3//:base64",
        "@raze__httparse__1_3_4//:httparse",
        "@raze__language_tags__0_2_2//:language_tags",
        "@raze__log__0_3_9//:log",
        "@raze__mime__0_2_6//:mime",
        "@raze__num_cpus__1_12_0//:num_cpus",
        "@raze__time__0_1_42//:time",
        "@raze__traitobject__0_1_0//:traitobject",
        "@raze__typeable__0_1_2//:typeable",
        "@raze__unicase__1_4_2//:unicase",
        "@raze__url__1_7_2//:url",
    ],
    rustc_flags = [
        "--cap-lints=allow",
    ],
    version = "0.10.16",
    crate_features = [
    ],
)

