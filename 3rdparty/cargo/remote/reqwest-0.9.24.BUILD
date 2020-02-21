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


# Unsupported target "async" with type "example" omitted
# Unsupported target "async" with type "test" omitted
# Unsupported target "async_multiple_requests" with type "example" omitted
# Unsupported target "async_stream" with type "example" omitted
# Unsupported target "badssl" with type "test" omitted
# Unsupported target "client" with type "test" omitted
# Unsupported target "cookie" with type "test" omitted
# Unsupported target "form" with type "example" omitted
# Unsupported target "gzip" with type "test" omitted
# Unsupported target "json_dynamic" with type "example" omitted
# Unsupported target "json_typed" with type "example" omitted
# Unsupported target "multipart" with type "test" omitted
# Unsupported target "proxy" with type "test" omitted
# Unsupported target "redirect" with type "test" omitted

rust_library(
    name = "reqwest",
    crate_root = "src/lib.rs",
    crate_type = "lib",
    edition = "2015",
    srcs = glob(["**/*.rs"]),
    deps = [
        "@raze__base64__0_10_1//:base64",
        "@raze__bytes__0_4_12//:bytes",
        "@raze__cookie__0_12_0//:cookie",
        "@raze__cookie_store__0_7_0//:cookie_store",
        "@raze__encoding_rs__0_8_22//:encoding_rs",
        "@raze__flate2__1_0_13//:flate2",
        "@raze__futures__0_1_29//:futures",
        "@raze__http__0_1_21//:http",
        "@raze__hyper__0_12_35//:hyper",
        "@raze__hyper_tls__0_3_2//:hyper_tls",
        "@raze__log__0_4_8//:log",
        "@raze__mime__0_3_16//:mime",
        "@raze__mime_guess__2_0_1//:mime_guess",
        "@raze__native_tls__0_2_3//:native_tls",
        "@raze__serde__1_0_104//:serde",
        "@raze__serde_json__1_0_48//:serde_json",
        "@raze__serde_urlencoded__0_5_5//:serde_urlencoded",
        "@raze__time__0_1_42//:time",
        "@raze__tokio__0_1_22//:tokio",
        "@raze__tokio_executor__0_1_10//:tokio_executor",
        "@raze__tokio_io__0_1_13//:tokio_io",
        "@raze__tokio_threadpool__0_1_18//:tokio_threadpool",
        "@raze__tokio_timer__0_2_13//:tokio_timer",
        "@raze__url__1_7_2//:url",
        "@raze__uuid__0_7_4//:uuid",
    ],
    rustc_flags = [
        "--cap-lints=allow",
    ],
    version = "0.9.24",
    crate_features = [
        "default",
        "default-tls",
        "hyper-tls",
        "native-tls",
        "tls",
    ],
)

# Unsupported target "simple" with type "example" omitted
# Unsupported target "timeouts" with type "test" omitted
