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


# Unsupported target "build-script-build" with type "custom-build" omitted
# Unsupported target "client" with type "example" omitted
# Unsupported target "client" with type "test" omitted
# Unsupported target "client_json" with type "example" omitted
# Unsupported target "echo" with type "example" omitted
# Unsupported target "end_to_end" with type "bench" omitted
# Unsupported target "hello" with type "example" omitted

rust_library(
    name = "hyper",
    crate_root = "src/lib.rs",
    crate_type = "lib",
    edition = "2015",
    srcs = glob(["**/*.rs"]),
    deps = [
        "@raze__bytes__0_4_12//:bytes",
        "@raze__futures__0_1_29//:futures",
        "@raze__futures_cpupool__0_1_8//:futures_cpupool",
        "@raze__h2__0_1_26//:h2",
        "@raze__http__0_1_21//:http",
        "@raze__http_body__0_1_0//:http_body",
        "@raze__httparse__1_3_4//:httparse",
        "@raze__iovec__0_1_4//:iovec",
        "@raze__itoa__0_4_5//:itoa",
        "@raze__log__0_4_8//:log",
        "@raze__net2__0_2_33//:net2",
        "@raze__time__0_1_42//:time",
        "@raze__tokio__0_1_22//:tokio",
        "@raze__tokio_buf__0_1_1//:tokio_buf",
        "@raze__tokio_executor__0_1_10//:tokio_executor",
        "@raze__tokio_io__0_1_13//:tokio_io",
        "@raze__tokio_reactor__0_1_12//:tokio_reactor",
        "@raze__tokio_tcp__0_1_4//:tokio_tcp",
        "@raze__tokio_threadpool__0_1_18//:tokio_threadpool",
        "@raze__tokio_timer__0_2_13//:tokio_timer",
        "@raze__want__0_2_0//:want",
    ],
    rustc_flags = [
        "--cap-lints=allow",
    ],
    version = "0.12.35",
    crate_features = [
        "__internal_flaky_tests",
        "default",
        "futures-cpupool",
        "net2",
        "runtime",
        "tokio",
        "tokio-executor",
        "tokio-reactor",
        "tokio-tcp",
        "tokio-threadpool",
        "tokio-timer",
    ],
)

# Unsupported target "integration" with type "test" omitted
# Unsupported target "multi_server" with type "example" omitted
# Unsupported target "params" with type "example" omitted
# Unsupported target "pipeline" with type "bench" omitted
# Unsupported target "proxy" with type "example" omitted
# Unsupported target "send_file" with type "example" omitted
# Unsupported target "server" with type "bench" omitted
# Unsupported target "server" with type "test" omitted
# Unsupported target "single_threaded" with type "example" omitted
# Unsupported target "state" with type "example" omitted
# Unsupported target "upgrades" with type "example" omitted
# Unsupported target "web_api" with type "example" omitted
