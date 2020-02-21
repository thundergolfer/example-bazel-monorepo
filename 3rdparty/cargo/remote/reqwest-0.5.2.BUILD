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


# Unsupported target "client" with type "test" omitted

rust_library(
    name = "reqwest",
    crate_root = "src/lib.rs",
    crate_type = "lib",
    edition = "2015",
    srcs = glob(["**/*.rs"]),
    deps = [
        "@raze__hyper__0_10_16//:hyper",
        "@raze__hyper_native_tls__0_2_4//:hyper_native_tls",
        "@raze__libflate__0_1_27//:libflate",
        "@raze__log__0_3_9//:log",
        "@raze__serde__0_9_15//:serde",
        "@raze__serde_json__0_9_10//:serde_json",
        "@raze__serde_urlencoded__0_4_3//:serde_urlencoded",
        "@raze__url__1_7_2//:url",
    ],
    rustc_flags = [
        "--cap-lints=allow",
    ],
    version = "0.5.2",
    crate_features = [
    ],
)

# Unsupported target "response_json" with type "example" omitted
# Unsupported target "server" with type "test" omitted
# Unsupported target "simple" with type "example" omitted
