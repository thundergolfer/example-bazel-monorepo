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
    name = "redox_users",
    crate_root = "src/lib.rs",
    crate_type = "lib",
    edition = "2015",
    srcs = glob(["**/*.rs"]),
    deps = [
        "@raze__getrandom__0_1_14//:getrandom",
        "@raze__redox_syscall__0_1_56//:redox_syscall",
        "@raze__rust_argon2__0_7_0//:rust_argon2",
    ],
    rustc_flags = [
        "--cap-lints=allow",
    ],
    version = "0.3.4",
    crate_features = [
    ],
)

