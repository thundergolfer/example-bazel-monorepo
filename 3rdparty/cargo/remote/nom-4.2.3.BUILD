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


# Unsupported target "arithmetic" with type "test" omitted
# Unsupported target "arithmetic_ast" with type "test" omitted
# Unsupported target "blockbuf-arithmetic" with type "test" omitted
# Unsupported target "build-script-build" with type "custom-build" omitted
# Unsupported target "complete_arithmetic" with type "test" omitted
# Unsupported target "complete_float" with type "test" omitted
# Unsupported target "css" with type "test" omitted
# Unsupported target "custom_errors" with type "test" omitted
# Unsupported target "float" with type "test" omitted
# Unsupported target "inference" with type "test" omitted
# Unsupported target "ini" with type "test" omitted
# Unsupported target "ini_str" with type "test" omitted
# Unsupported target "issues" with type "test" omitted
# Unsupported target "json" with type "test" omitted
# Unsupported target "mp4" with type "test" omitted
# Unsupported target "multiline" with type "test" omitted
# Unsupported target "named_args" with type "test" omitted

rust_library(
    name = "nom",
    crate_root = "src/lib.rs",
    crate_type = "lib",
    edition = "2015",
    srcs = glob(["**/*.rs"]),
    deps = [
        "@raze__memchr__2_3_2//:memchr",
    ],
    rustc_flags = [
        "--cap-lints=allow",
    ],
    version = "4.2.3",
    crate_features = [
        "alloc",
        "default",
        "std",
    ],
)

# Unsupported target "overflow" with type "test" omitted
# Unsupported target "reborrow_fold" with type "test" omitted
# Unsupported target "test1" with type "test" omitted
