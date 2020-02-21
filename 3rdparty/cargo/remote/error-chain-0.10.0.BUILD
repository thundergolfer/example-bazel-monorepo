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


# Unsupported target "all" with type "example" omitted
# Unsupported target "doc" with type "example" omitted

rust_library(
    name = "error_chain",
    crate_root = "src/lib.rs",
    crate_type = "lib",
    edition = "2015",
    srcs = glob(["**/*.rs"]),
    deps = [
        "@raze__backtrace__0_3_44//:backtrace",
    ],
    rustc_flags = [
        "--cap-lints=allow",
    ],
    version = "0.10.0",
    crate_features = [
        "backtrace",
        "default",
        "example_generated",
    ],
)

# Unsupported target "quick_main" with type "test" omitted
# Unsupported target "quickstart" with type "example" omitted
# Unsupported target "size" with type "example" omitted
# Unsupported target "tests" with type "test" omitted
