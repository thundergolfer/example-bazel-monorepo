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
  "restricted", # "MIT OR Apache-2.0"
])

load(
    "@io_bazel_rules_rust//rust:rust.bzl",
    "rust_library",
    "rust_binary",
    "rust_test",
)


# Unsupported target "namedtempfile" with type "test" omitted
# Unsupported target "spooled" with type "test" omitted
# Unsupported target "tempdir" with type "test" omitted

rust_library(
    name = "tempfile",
    crate_root = "src/lib.rs",
    crate_type = "lib",
    edition = "2018",
    srcs = glob(["**/*.rs"]),
    deps = [
        "@raze__cfg_if__0_1_10//:cfg_if",
        "@raze__libc__0_2_67//:libc",
        "@raze__rand__0_7_3//:rand",
        "@raze__remove_dir_all__0_5_2//:remove_dir_all",
    ],
    rustc_flags = [
        "--cap-lints=allow",
    ],
    version = "3.1.0",
    crate_features = [
    ],
)

# Unsupported target "tempfile" with type "test" omitted
