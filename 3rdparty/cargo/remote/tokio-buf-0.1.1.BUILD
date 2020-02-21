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


# Unsupported target "buf_stream" with type "test" omitted
# Unsupported target "chain" with type "test" omitted
# Unsupported target "collect" with type "test" omitted
# Unsupported target "iter" with type "test" omitted
# Unsupported target "limit" with type "test" omitted
# Unsupported target "size_hint" with type "test" omitted
# Unsupported target "stream" with type "test" omitted
# Unsupported target "string" with type "test" omitted
# Unsupported target "support" with type "test" omitted

rust_library(
    name = "tokio_buf",
    crate_root = "src/lib.rs",
    crate_type = "lib",
    edition = "2015",
    srcs = glob(["**/*.rs"]),
    deps = [
        "@raze__bytes__0_4_12//:bytes",
        "@raze__either__1_5_3//:either",
        "@raze__futures__0_1_29//:futures",
    ],
    rustc_flags = [
        "--cap-lints=allow",
    ],
    version = "0.1.1",
    crate_features = [
        "default",
        "either",
        "util",
    ],
)

