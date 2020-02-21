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


# Unsupported target "build-script-build" with type "custom-build" omitted
alias(
  name = "rust_crypto",
  actual = ":crypto",
)

rust_library(
    name = "crypto",
    crate_root = "src/lib.rs",
    crate_type = "lib",
    edition = "2015",
    srcs = glob(["**/*.rs"]),
    deps = [
        "@raze__libc__0_2_67//:libc",
        "@raze__rand__0_3_23//:rand",
        "@raze__rustc_serialize__0_3_24//:rustc_serialize",
        "@raze__time__0_1_42//:time",
    ],
    rustc_flags = [
        "--cap-lints=allow",
    ],
    version = "0.2.36",
    crate_features = [
    ],
)

# Unsupported target "symmetriccipher" with type "example" omitted
