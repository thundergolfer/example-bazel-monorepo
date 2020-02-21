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


# Unsupported target "data" with type "test" omitted
# Unsupported target "parse_url" with type "bench" omitted
# Unsupported target "unit" with type "test" omitted

rust_library(
    name = "url",
    crate_root = "src/lib.rs",
    crate_type = "lib",
    edition = "2015",
    srcs = glob(["**/*.rs"]),
    deps = [
        "@raze__idna__0_2_0//:idna",
        "@raze__matches__0_1_8//:matches",
        "@raze__percent_encoding__2_1_0//:percent_encoding",
    ],
    rustc_flags = [
        "--cap-lints=allow",
    ],
    version = "2.1.1",
    crate_features = [
    ],
)

