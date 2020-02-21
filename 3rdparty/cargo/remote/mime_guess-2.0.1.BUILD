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


# Unsupported target "benchmark" with type "bench" omitted
# Unsupported target "build-script-build" with type "custom-build" omitted

rust_library(
    name = "mime_guess",
    crate_root = "src/lib.rs",
    crate_type = "lib",
    edition = "2015",
    srcs = glob(["**/*.rs"]),
    deps = [
        "@raze__mime__0_3_16//:mime",
        "@raze__unicase__2_6_0//:unicase",
    ],
    rustc_flags = [
        "--cap-lints=allow",
    ],
    version = "2.0.1",
    crate_features = [
        "default",
        "rev-mappings",
    ],
)

# Unsupported target "rev_map" with type "example" omitted
