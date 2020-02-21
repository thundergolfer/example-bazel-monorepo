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


# Unsupported target "build-script-build" with type "custom-build" omitted

rust_library(
    name = "winapi",
    crate_root = "src/lib.rs",
    crate_type = "lib",
    edition = "2015",
    srcs = glob(["**/*.rs"]),
    deps = [
    ],
    rustc_flags = [
        "--cap-lints=allow",
    ],
    version = "0.3.8",
    crate_features = [
        "consoleapi",
        "errhandlingapi",
        "fileapi",
        "handleapi",
        "impl-debug",
        "impl-default",
        "knownfolders",
        "lmcons",
        "minschannel",
        "minwinbase",
        "minwindef",
        "ntdef",
        "ntsecapi",
        "ntstatus",
        "objbase",
        "processenv",
        "profileapi",
        "schannel",
        "securitybaseapi",
        "shlobj",
        "sspi",
        "std",
        "sysinfoapi",
        "timezoneapi",
        "winbase",
        "wincon",
        "wincrypt",
        "winerror",
        "winnt",
        "winreg",
        "winsock2",
        "ws2def",
        "ws2ipdef",
        "ws2tcpip",
        "wtypesbase",
    ],
)

