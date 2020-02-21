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


# Unsupported target "api" with type "test" omitted
# Unsupported target "ast" with type "example" omitted
# Unsupported target "ast" with type "test" omitted
# Unsupported target "dom-api" with type "test" omitted
# Unsupported target "print_pos" with type "example" omitted

rust_library(
    name = "roxmltree",
    crate_root = "src/lib.rs",
    crate_type = "lib",
    edition = "2015",
    srcs = glob(["**/*.rs"]),
    deps = [
        "@raze__xmlparser__0_9_0//:xmlparser",
    ],
    rustc_flags = [
        "--cap-lints=allow",
    ],
    version = "0.6.1",
    crate_features = [
    ],
)

# Unsupported target "stats" with type "example" omitted
