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
  "notice", # "Apache-2.0"
])

load(
    "@io_bazel_rules_rust//rust:rust.bzl",
    "rust_library",
    "rust_binary",
    "rust_test",
)


# Unsupported target "build-script-build" with type "custom-build" omitted
# Unsupported target "mk_certs" with type "example" omitted

rust_library(
    name = "openssl",
    crate_root = "src/lib.rs",
    crate_type = "lib",
    edition = "2015",
    srcs = glob(["**/*.rs"]),
    deps = [
        "@raze__bitflags__0_9_1//:bitflags",
        "@raze__foreign_types__0_3_2//:foreign_types",
        "@raze__lazy_static__1_4_0//:lazy_static",
        "@raze__libc__0_2_67//:libc",
        "@raze__openssl_sys__0_9_54//:openssl_sys",
    ],
    rustc_flags = [
        "--cap-lints=allow",
    ],
    version = "0.9.24",
    crate_features = [
    ],
)

