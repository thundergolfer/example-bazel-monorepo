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
# Unsupported target "google-connect" with type "example" omitted

rust_library(
    name = "native_tls",
    crate_root = "src/lib.rs",
    crate_type = "lib",
    edition = "2015",
    srcs = glob(["**/*.rs"]),
    deps = [
        "@raze__log__0_4_8//:log",
        "@raze__openssl__0_10_28//:openssl",
        "@raze__openssl_probe__0_1_2//:openssl_probe",
        "@raze__openssl_sys__0_9_54//:openssl_sys",
    ],
    rustc_flags = [
        "--cap-lints=allow",
    ],
    version = "0.2.3",
    crate_features = [
    ],
)

# Unsupported target "simple-server" with type "example" omitted
