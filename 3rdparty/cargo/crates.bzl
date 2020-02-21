"""
cargo-raze crate workspace functions

DO NOT EDIT! Replaced on runs of cargo-raze
"""
load("@bazel_tools//tools/build_defs/repo:http.bzl", "http_archive")
load("@bazel_tools//tools/build_defs/repo:git.bzl", "new_git_repository")

def _new_http_archive(name, **kwargs):
    if not native.existing_rule(name):
        http_archive(name=name, **kwargs)

def _new_git_repository(name, **kwargs):
    if not native.existing_rule(name):
        new_git_repository(name=name, **kwargs)

def raze_fetch_remote_crates():

    _new_http_archive(
        name = "raze__adler32__1_0_4",
        url = "https://crates-io.s3-us-west-1.amazonaws.com/crates/adler32/adler32-1.0.4.crate",
        type = "tar.gz",
        strip_prefix = "adler32-1.0.4",

        build_file = Label("//3rdparty/cargo/remote:adler32-1.0.4.BUILD"),
    )

    _new_http_archive(
        name = "raze__aho_corasick__0_7_8",
        url = "https://crates-io.s3-us-west-1.amazonaws.com/crates/aho-corasick/aho-corasick-0.7.8.crate",
        type = "tar.gz",
        strip_prefix = "aho-corasick-0.7.8",

        build_file = Label("//3rdparty/cargo/remote:aho-corasick-0.7.8.BUILD"),
    )

    _new_http_archive(
        name = "raze__ansi_term__0_11_0",
        url = "https://crates-io.s3-us-west-1.amazonaws.com/crates/ansi_term/ansi_term-0.11.0.crate",
        type = "tar.gz",
        strip_prefix = "ansi_term-0.11.0",

        build_file = Label("//3rdparty/cargo/remote:ansi_term-0.11.0.BUILD"),
    )

    _new_http_archive(
        name = "raze__antidote__1_0_0",
        url = "https://crates-io.s3-us-west-1.amazonaws.com/crates/antidote/antidote-1.0.0.crate",
        type = "tar.gz",
        strip_prefix = "antidote-1.0.0",

        build_file = Label("//3rdparty/cargo/remote:antidote-1.0.0.BUILD"),
    )

    _new_http_archive(
        name = "raze__anyhow__1_0_26",
        url = "https://crates-io.s3-us-west-1.amazonaws.com/crates/anyhow/anyhow-1.0.26.crate",
        type = "tar.gz",
        strip_prefix = "anyhow-1.0.26",

        build_file = Label("//3rdparty/cargo/remote:anyhow-1.0.26.BUILD"),
    )

    _new_http_archive(
        name = "raze__arrayref__0_3_6",
        url = "https://crates-io.s3-us-west-1.amazonaws.com/crates/arrayref/arrayref-0.3.6.crate",
        type = "tar.gz",
        strip_prefix = "arrayref-0.3.6",

        build_file = Label("//3rdparty/cargo/remote:arrayref-0.3.6.BUILD"),
    )

    _new_http_archive(
        name = "raze__arrayvec__0_5_1",
        url = "https://crates-io.s3-us-west-1.amazonaws.com/crates/arrayvec/arrayvec-0.5.1.crate",
        type = "tar.gz",
        strip_prefix = "arrayvec-0.5.1",

        build_file = Label("//3rdparty/cargo/remote:arrayvec-0.5.1.BUILD"),
    )

    _new_http_archive(
        name = "raze__atty__0_2_14",
        url = "https://crates-io.s3-us-west-1.amazonaws.com/crates/atty/atty-0.2.14.crate",
        type = "tar.gz",
        strip_prefix = "atty-0.2.14",

        build_file = Label("//3rdparty/cargo/remote:atty-0.2.14.BUILD"),
    )

    _new_http_archive(
        name = "raze__autocfg__0_1_7",
        url = "https://crates-io.s3-us-west-1.amazonaws.com/crates/autocfg/autocfg-0.1.7.crate",
        type = "tar.gz",
        strip_prefix = "autocfg-0.1.7",

        build_file = Label("//3rdparty/cargo/remote:autocfg-0.1.7.BUILD"),
    )

    _new_http_archive(
        name = "raze__autocfg__1_0_0",
        url = "https://crates-io.s3-us-west-1.amazonaws.com/crates/autocfg/autocfg-1.0.0.crate",
        type = "tar.gz",
        strip_prefix = "autocfg-1.0.0",

        build_file = Label("//3rdparty/cargo/remote:autocfg-1.0.0.BUILD"),
    )

    _new_http_archive(
        name = "raze__backtrace__0_3_44",
        url = "https://crates-io.s3-us-west-1.amazonaws.com/crates/backtrace/backtrace-0.3.44.crate",
        type = "tar.gz",
        strip_prefix = "backtrace-0.3.44",

        build_file = Label("//3rdparty/cargo/remote:backtrace-0.3.44.BUILD"),
    )

    _new_http_archive(
        name = "raze__backtrace_sys__0_1_32",
        url = "https://crates-io.s3-us-west-1.amazonaws.com/crates/backtrace-sys/backtrace-sys-0.1.32.crate",
        type = "tar.gz",
        strip_prefix = "backtrace-sys-0.1.32",

        build_file = Label("//3rdparty/cargo/remote:backtrace-sys-0.1.32.BUILD"),
    )

    _new_http_archive(
        name = "raze__base64__0_10_1",
        url = "https://crates-io.s3-us-west-1.amazonaws.com/crates/base64/base64-0.10.1.crate",
        type = "tar.gz",
        strip_prefix = "base64-0.10.1",

        build_file = Label("//3rdparty/cargo/remote:base64-0.10.1.BUILD"),
    )

    _new_http_archive(
        name = "raze__base64__0_11_0",
        url = "https://crates-io.s3-us-west-1.amazonaws.com/crates/base64/base64-0.11.0.crate",
        type = "tar.gz",
        strip_prefix = "base64-0.11.0",

        build_file = Label("//3rdparty/cargo/remote:base64-0.11.0.BUILD"),
    )

    _new_http_archive(
        name = "raze__base64__0_5_2",
        url = "https://crates-io.s3-us-west-1.amazonaws.com/crates/base64/base64-0.5.2.crate",
        type = "tar.gz",
        strip_prefix = "base64-0.5.2",

        build_file = Label("//3rdparty/cargo/remote:base64-0.5.2.BUILD"),
    )

    _new_http_archive(
        name = "raze__base64__0_9_3",
        url = "https://crates-io.s3-us-west-1.amazonaws.com/crates/base64/base64-0.9.3.crate",
        type = "tar.gz",
        strip_prefix = "base64-0.9.3",

        build_file = Label("//3rdparty/cargo/remote:base64-0.9.3.BUILD"),
    )

    _new_http_archive(
        name = "raze__bitflags__0_9_1",
        url = "https://crates-io.s3-us-west-1.amazonaws.com/crates/bitflags/bitflags-0.9.1.crate",
        type = "tar.gz",
        strip_prefix = "bitflags-0.9.1",

        build_file = Label("//3rdparty/cargo/remote:bitflags-0.9.1.BUILD"),
    )

    _new_http_archive(
        name = "raze__bitflags__1_2_1",
        url = "https://crates-io.s3-us-west-1.amazonaws.com/crates/bitflags/bitflags-1.2.1.crate",
        type = "tar.gz",
        strip_prefix = "bitflags-1.2.1",

        build_file = Label("//3rdparty/cargo/remote:bitflags-1.2.1.BUILD"),
    )

    _new_http_archive(
        name = "raze__blake2b_simd__0_5_10",
        url = "https://crates-io.s3-us-west-1.amazonaws.com/crates/blake2b_simd/blake2b_simd-0.5.10.crate",
        type = "tar.gz",
        strip_prefix = "blake2b_simd-0.5.10",

        build_file = Label("//3rdparty/cargo/remote:blake2b_simd-0.5.10.BUILD"),
    )

    _new_http_archive(
        name = "raze__bumpalo__3_2_0",
        url = "https://crates-io.s3-us-west-1.amazonaws.com/crates/bumpalo/bumpalo-3.2.0.crate",
        type = "tar.gz",
        strip_prefix = "bumpalo-3.2.0",

        build_file = Label("//3rdparty/cargo/remote:bumpalo-3.2.0.BUILD"),
    )

    _new_http_archive(
        name = "raze__byteorder__1_3_4",
        url = "https://crates-io.s3-us-west-1.amazonaws.com/crates/byteorder/byteorder-1.3.4.crate",
        type = "tar.gz",
        strip_prefix = "byteorder-1.3.4",

        build_file = Label("//3rdparty/cargo/remote:byteorder-1.3.4.BUILD"),
    )

    _new_http_archive(
        name = "raze__bytes__0_4_12",
        url = "https://crates-io.s3-us-west-1.amazonaws.com/crates/bytes/bytes-0.4.12.crate",
        type = "tar.gz",
        strip_prefix = "bytes-0.4.12",

        build_file = Label("//3rdparty/cargo/remote:bytes-0.4.12.BUILD"),
    )

    _new_http_archive(
        name = "raze__c2_chacha__0_2_3",
        url = "https://crates-io.s3-us-west-1.amazonaws.com/crates/c2-chacha/c2-chacha-0.2.3.crate",
        type = "tar.gz",
        strip_prefix = "c2-chacha-0.2.3",

        build_file = Label("//3rdparty/cargo/remote:c2-chacha-0.2.3.BUILD"),
    )

    _new_http_archive(
        name = "raze__cc__1_0_50",
        url = "https://crates-io.s3-us-west-1.amazonaws.com/crates/cc/cc-1.0.50.crate",
        type = "tar.gz",
        strip_prefix = "cc-1.0.50",

        build_file = Label("//3rdparty/cargo/remote:cc-1.0.50.BUILD"),
    )

    _new_http_archive(
        name = "raze__cfg_if__0_1_10",
        url = "https://crates-io.s3-us-west-1.amazonaws.com/crates/cfg-if/cfg-if-0.1.10.crate",
        type = "tar.gz",
        strip_prefix = "cfg-if-0.1.10",

        build_file = Label("//3rdparty/cargo/remote:cfg-if-0.1.10.BUILD"),
    )

    _new_http_archive(
        name = "raze__clap__2_33_0",
        url = "https://crates-io.s3-us-west-1.amazonaws.com/crates/clap/clap-2.33.0.crate",
        type = "tar.gz",
        strip_prefix = "clap-2.33.0",

        build_file = Label("//3rdparty/cargo/remote:clap-2.33.0.BUILD"),
    )

    _new_http_archive(
        name = "raze__cloudabi__0_0_3",
        url = "https://crates-io.s3-us-west-1.amazonaws.com/crates/cloudabi/cloudabi-0.0.3.crate",
        type = "tar.gz",
        strip_prefix = "cloudabi-0.0.3",

        build_file = Label("//3rdparty/cargo/remote:cloudabi-0.0.3.BUILD"),
    )

    _new_http_archive(
        name = "raze__config__0_9_3",
        url = "https://crates-io.s3-us-west-1.amazonaws.com/crates/config/config-0.9.3.crate",
        type = "tar.gz",
        strip_prefix = "config-0.9.3",

        build_file = Label("//3rdparty/cargo/remote:config-0.9.3.BUILD"),
    )

    _new_http_archive(
        name = "raze__constant_time_eq__0_1_5",
        url = "https://crates-io.s3-us-west-1.amazonaws.com/crates/constant_time_eq/constant_time_eq-0.1.5.crate",
        type = "tar.gz",
        strip_prefix = "constant_time_eq-0.1.5",

        build_file = Label("//3rdparty/cargo/remote:constant_time_eq-0.1.5.BUILD"),
    )

    _new_http_archive(
        name = "raze__cookie__0_12_0",
        url = "https://crates-io.s3-us-west-1.amazonaws.com/crates/cookie/cookie-0.12.0.crate",
        type = "tar.gz",
        strip_prefix = "cookie-0.12.0",

        build_file = Label("//3rdparty/cargo/remote:cookie-0.12.0.BUILD"),
    )

    _new_http_archive(
        name = "raze__cookie_store__0_7_0",
        url = "https://crates-io.s3-us-west-1.amazonaws.com/crates/cookie_store/cookie_store-0.7.0.crate",
        type = "tar.gz",
        strip_prefix = "cookie_store-0.7.0",

        build_file = Label("//3rdparty/cargo/remote:cookie_store-0.7.0.BUILD"),
    )

    _new_http_archive(
        name = "raze__core_foundation__0_2_3",
        url = "https://crates-io.s3-us-west-1.amazonaws.com/crates/core-foundation/core-foundation-0.2.3.crate",
        type = "tar.gz",
        strip_prefix = "core-foundation-0.2.3",

        build_file = Label("//3rdparty/cargo/remote:core-foundation-0.2.3.BUILD"),
    )

    _new_http_archive(
        name = "raze__core_foundation__0_6_4",
        url = "https://crates-io.s3-us-west-1.amazonaws.com/crates/core-foundation/core-foundation-0.6.4.crate",
        type = "tar.gz",
        strip_prefix = "core-foundation-0.6.4",

        build_file = Label("//3rdparty/cargo/remote:core-foundation-0.6.4.BUILD"),
    )

    _new_http_archive(
        name = "raze__core_foundation_sys__0_2_3",
        url = "https://crates-io.s3-us-west-1.amazonaws.com/crates/core-foundation-sys/core-foundation-sys-0.2.3.crate",
        type = "tar.gz",
        strip_prefix = "core-foundation-sys-0.2.3",

        build_file = Label("//3rdparty/cargo/remote:core-foundation-sys-0.2.3.BUILD"),
    )

    _new_http_archive(
        name = "raze__core_foundation_sys__0_6_2",
        url = "https://crates-io.s3-us-west-1.amazonaws.com/crates/core-foundation-sys/core-foundation-sys-0.6.2.crate",
        type = "tar.gz",
        strip_prefix = "core-foundation-sys-0.6.2",

        build_file = Label("//3rdparty/cargo/remote:core-foundation-sys-0.6.2.BUILD"),
    )

    _new_http_archive(
        name = "raze__crc32fast__1_2_0",
        url = "https://crates-io.s3-us-west-1.amazonaws.com/crates/crc32fast/crc32fast-1.2.0.crate",
        type = "tar.gz",
        strip_prefix = "crc32fast-1.2.0",

        build_file = Label("//3rdparty/cargo/remote:crc32fast-1.2.0.BUILD"),
    )

    _new_http_archive(
        name = "raze__crossbeam_deque__0_7_2",
        url = "https://crates-io.s3-us-west-1.amazonaws.com/crates/crossbeam-deque/crossbeam-deque-0.7.2.crate",
        type = "tar.gz",
        strip_prefix = "crossbeam-deque-0.7.2",

        build_file = Label("//3rdparty/cargo/remote:crossbeam-deque-0.7.2.BUILD"),
    )

    _new_http_archive(
        name = "raze__crossbeam_epoch__0_8_0",
        url = "https://crates-io.s3-us-west-1.amazonaws.com/crates/crossbeam-epoch/crossbeam-epoch-0.8.0.crate",
        type = "tar.gz",
        strip_prefix = "crossbeam-epoch-0.8.0",

        build_file = Label("//3rdparty/cargo/remote:crossbeam-epoch-0.8.0.BUILD"),
    )

    _new_http_archive(
        name = "raze__crossbeam_queue__0_2_1",
        url = "https://crates-io.s3-us-west-1.amazonaws.com/crates/crossbeam-queue/crossbeam-queue-0.2.1.crate",
        type = "tar.gz",
        strip_prefix = "crossbeam-queue-0.2.1",

        build_file = Label("//3rdparty/cargo/remote:crossbeam-queue-0.2.1.BUILD"),
    )

    _new_http_archive(
        name = "raze__crossbeam_utils__0_7_0",
        url = "https://crates-io.s3-us-west-1.amazonaws.com/crates/crossbeam-utils/crossbeam-utils-0.7.0.crate",
        type = "tar.gz",
        strip_prefix = "crossbeam-utils-0.7.0",

        build_file = Label("//3rdparty/cargo/remote:crossbeam-utils-0.7.0.BUILD"),
    )

    _new_http_archive(
        name = "raze__dirs__2_0_2",
        url = "https://crates-io.s3-us-west-1.amazonaws.com/crates/dirs/dirs-2.0.2.crate",
        type = "tar.gz",
        strip_prefix = "dirs-2.0.2",

        build_file = Label("//3rdparty/cargo/remote:dirs-2.0.2.BUILD"),
    )

    _new_http_archive(
        name = "raze__dirs_sys__0_3_4",
        url = "https://crates-io.s3-us-west-1.amazonaws.com/crates/dirs-sys/dirs-sys-0.3.4.crate",
        type = "tar.gz",
        strip_prefix = "dirs-sys-0.3.4",

        build_file = Label("//3rdparty/cargo/remote:dirs-sys-0.3.4.BUILD"),
    )

    _new_http_archive(
        name = "raze__dtoa__0_4_5",
        url = "https://crates-io.s3-us-west-1.amazonaws.com/crates/dtoa/dtoa-0.4.5.crate",
        type = "tar.gz",
        strip_prefix = "dtoa-0.4.5",

        build_file = Label("//3rdparty/cargo/remote:dtoa-0.4.5.BUILD"),
    )

    _new_http_archive(
        name = "raze__either__1_5_3",
        url = "https://crates-io.s3-us-west-1.amazonaws.com/crates/either/either-1.5.3.crate",
        type = "tar.gz",
        strip_prefix = "either-1.5.3",

        build_file = Label("//3rdparty/cargo/remote:either-1.5.3.BUILD"),
    )

    _new_http_archive(
        name = "raze__encoding_rs__0_8_22",
        url = "https://crates-io.s3-us-west-1.amazonaws.com/crates/encoding_rs/encoding_rs-0.8.22.crate",
        type = "tar.gz",
        strip_prefix = "encoding_rs-0.8.22",

        build_file = Label("//3rdparty/cargo/remote:encoding_rs-0.8.22.BUILD"),
    )

    _new_http_archive(
        name = "raze__error_chain__0_10_0",
        url = "https://crates-io.s3-us-west-1.amazonaws.com/crates/error-chain/error-chain-0.10.0.crate",
        type = "tar.gz",
        strip_prefix = "error-chain-0.10.0",

        build_file = Label("//3rdparty/cargo/remote:error-chain-0.10.0.BUILD"),
    )

    _new_http_archive(
        name = "raze__error_chain__0_12_2",
        url = "https://crates-io.s3-us-west-1.amazonaws.com/crates/error-chain/error-chain-0.12.2.crate",
        type = "tar.gz",
        strip_prefix = "error-chain-0.12.2",

        build_file = Label("//3rdparty/cargo/remote:error-chain-0.12.2.BUILD"),
    )

    _new_http_archive(
        name = "raze__failure__0_1_6",
        url = "https://crates-io.s3-us-west-1.amazonaws.com/crates/failure/failure-0.1.6.crate",
        type = "tar.gz",
        strip_prefix = "failure-0.1.6",

        build_file = Label("//3rdparty/cargo/remote:failure-0.1.6.BUILD"),
    )

    _new_http_archive(
        name = "raze__failure_derive__0_1_6",
        url = "https://crates-io.s3-us-west-1.amazonaws.com/crates/failure_derive/failure_derive-0.1.6.crate",
        type = "tar.gz",
        strip_prefix = "failure_derive-0.1.6",

        build_file = Label("//3rdparty/cargo/remote:failure_derive-0.1.6.BUILD"),
    )

    _new_http_archive(
        name = "raze__flate2__1_0_13",
        url = "https://crates-io.s3-us-west-1.amazonaws.com/crates/flate2/flate2-1.0.13.crate",
        type = "tar.gz",
        strip_prefix = "flate2-1.0.13",

        build_file = Label("//3rdparty/cargo/remote:flate2-1.0.13.BUILD"),
    )

    _new_http_archive(
        name = "raze__fnv__1_0_6",
        url = "https://crates-io.s3-us-west-1.amazonaws.com/crates/fnv/fnv-1.0.6.crate",
        type = "tar.gz",
        strip_prefix = "fnv-1.0.6",

        build_file = Label("//3rdparty/cargo/remote:fnv-1.0.6.BUILD"),
    )

    _new_http_archive(
        name = "raze__foreign_types__0_3_2",
        url = "https://crates-io.s3-us-west-1.amazonaws.com/crates/foreign-types/foreign-types-0.3.2.crate",
        type = "tar.gz",
        strip_prefix = "foreign-types-0.3.2",

        build_file = Label("//3rdparty/cargo/remote:foreign-types-0.3.2.BUILD"),
    )

    _new_http_archive(
        name = "raze__foreign_types_shared__0_1_1",
        url = "https://crates-io.s3-us-west-1.amazonaws.com/crates/foreign-types-shared/foreign-types-shared-0.1.1.crate",
        type = "tar.gz",
        strip_prefix = "foreign-types-shared-0.1.1",

        build_file = Label("//3rdparty/cargo/remote:foreign-types-shared-0.1.1.BUILD"),
    )

    _new_http_archive(
        name = "raze__fuchsia_cprng__0_1_1",
        url = "https://crates-io.s3-us-west-1.amazonaws.com/crates/fuchsia-cprng/fuchsia-cprng-0.1.1.crate",
        type = "tar.gz",
        strip_prefix = "fuchsia-cprng-0.1.1",

        build_file = Label("//3rdparty/cargo/remote:fuchsia-cprng-0.1.1.BUILD"),
    )

    _new_http_archive(
        name = "raze__fuchsia_zircon__0_3_3",
        url = "https://crates-io.s3-us-west-1.amazonaws.com/crates/fuchsia-zircon/fuchsia-zircon-0.3.3.crate",
        type = "tar.gz",
        strip_prefix = "fuchsia-zircon-0.3.3",

        build_file = Label("//3rdparty/cargo/remote:fuchsia-zircon-0.3.3.BUILD"),
    )

    _new_http_archive(
        name = "raze__fuchsia_zircon_sys__0_3_3",
        url = "https://crates-io.s3-us-west-1.amazonaws.com/crates/fuchsia-zircon-sys/fuchsia-zircon-sys-0.3.3.crate",
        type = "tar.gz",
        strip_prefix = "fuchsia-zircon-sys-0.3.3",

        build_file = Label("//3rdparty/cargo/remote:fuchsia-zircon-sys-0.3.3.BUILD"),
    )

    _new_http_archive(
        name = "raze__futures__0_1_29",
        url = "https://crates-io.s3-us-west-1.amazonaws.com/crates/futures/futures-0.1.29.crate",
        type = "tar.gz",
        strip_prefix = "futures-0.1.29",

        build_file = Label("//3rdparty/cargo/remote:futures-0.1.29.BUILD"),
    )

    _new_http_archive(
        name = "raze__futures_cpupool__0_1_8",
        url = "https://crates-io.s3-us-west-1.amazonaws.com/crates/futures-cpupool/futures-cpupool-0.1.8.crate",
        type = "tar.gz",
        strip_prefix = "futures-cpupool-0.1.8",

        build_file = Label("//3rdparty/cargo/remote:futures-cpupool-0.1.8.BUILD"),
    )

    _new_http_archive(
        name = "raze__gcc__0_3_55",
        url = "https://crates-io.s3-us-west-1.amazonaws.com/crates/gcc/gcc-0.3.55.crate",
        type = "tar.gz",
        strip_prefix = "gcc-0.3.55",

        build_file = Label("//3rdparty/cargo/remote:gcc-0.3.55.BUILD"),
    )

    _new_http_archive(
        name = "raze__getrandom__0_1_14",
        url = "https://crates-io.s3-us-west-1.amazonaws.com/crates/getrandom/getrandom-0.1.14.crate",
        type = "tar.gz",
        strip_prefix = "getrandom-0.1.14",

        build_file = Label("//3rdparty/cargo/remote:getrandom-0.1.14.BUILD"),
    )

    _new_http_archive(
        name = "raze__h2__0_1_26",
        url = "https://crates-io.s3-us-west-1.amazonaws.com/crates/h2/h2-0.1.26.crate",
        type = "tar.gz",
        strip_prefix = "h2-0.1.26",

        build_file = Label("//3rdparty/cargo/remote:h2-0.1.26.BUILD"),
    )

    _new_http_archive(
        name = "raze__heck__0_3_1",
        url = "https://crates-io.s3-us-west-1.amazonaws.com/crates/heck/heck-0.3.1.crate",
        type = "tar.gz",
        strip_prefix = "heck-0.3.1",

        build_file = Label("//3rdparty/cargo/remote:heck-0.3.1.BUILD"),
    )

    _new_http_archive(
        name = "raze__hermit_abi__0_1_7",
        url = "https://crates-io.s3-us-west-1.amazonaws.com/crates/hermit-abi/hermit-abi-0.1.7.crate",
        type = "tar.gz",
        strip_prefix = "hermit-abi-0.1.7",

        build_file = Label("//3rdparty/cargo/remote:hermit-abi-0.1.7.BUILD"),
    )

    _new_http_archive(
        name = "raze__http__0_1_21",
        url = "https://crates-io.s3-us-west-1.amazonaws.com/crates/http/http-0.1.21.crate",
        type = "tar.gz",
        strip_prefix = "http-0.1.21",

        build_file = Label("//3rdparty/cargo/remote:http-0.1.21.BUILD"),
    )

    _new_http_archive(
        name = "raze__http_body__0_1_0",
        url = "https://crates-io.s3-us-west-1.amazonaws.com/crates/http-body/http-body-0.1.0.crate",
        type = "tar.gz",
        strip_prefix = "http-body-0.1.0",

        build_file = Label("//3rdparty/cargo/remote:http-body-0.1.0.BUILD"),
    )

    _new_http_archive(
        name = "raze__httparse__1_3_4",
        url = "https://crates-io.s3-us-west-1.amazonaws.com/crates/httparse/httparse-1.3.4.crate",
        type = "tar.gz",
        strip_prefix = "httparse-1.3.4",

        build_file = Label("//3rdparty/cargo/remote:httparse-1.3.4.BUILD"),
    )

    _new_http_archive(
        name = "raze__hyper__0_10_16",
        url = "https://crates-io.s3-us-west-1.amazonaws.com/crates/hyper/hyper-0.10.16.crate",
        type = "tar.gz",
        strip_prefix = "hyper-0.10.16",

        build_file = Label("//3rdparty/cargo/remote:hyper-0.10.16.BUILD"),
    )

    _new_http_archive(
        name = "raze__hyper__0_12_35",
        url = "https://crates-io.s3-us-west-1.amazonaws.com/crates/hyper/hyper-0.12.35.crate",
        type = "tar.gz",
        strip_prefix = "hyper-0.12.35",

        build_file = Label("//3rdparty/cargo/remote:hyper-0.12.35.BUILD"),
    )

    _new_http_archive(
        name = "raze__hyper_native_tls__0_2_4",
        url = "https://crates-io.s3-us-west-1.amazonaws.com/crates/hyper-native-tls/hyper-native-tls-0.2.4.crate",
        type = "tar.gz",
        strip_prefix = "hyper-native-tls-0.2.4",

        build_file = Label("//3rdparty/cargo/remote:hyper-native-tls-0.2.4.BUILD"),
    )

    _new_http_archive(
        name = "raze__hyper_tls__0_3_2",
        url = "https://crates-io.s3-us-west-1.amazonaws.com/crates/hyper-tls/hyper-tls-0.3.2.crate",
        type = "tar.gz",
        strip_prefix = "hyper-tls-0.3.2",

        build_file = Label("//3rdparty/cargo/remote:hyper-tls-0.3.2.BUILD"),
    )

    _new_http_archive(
        name = "raze__idna__0_1_5",
        url = "https://crates-io.s3-us-west-1.amazonaws.com/crates/idna/idna-0.1.5.crate",
        type = "tar.gz",
        strip_prefix = "idna-0.1.5",

        build_file = Label("//3rdparty/cargo/remote:idna-0.1.5.BUILD"),
    )

    _new_http_archive(
        name = "raze__idna__0_2_0",
        url = "https://crates-io.s3-us-west-1.amazonaws.com/crates/idna/idna-0.2.0.crate",
        type = "tar.gz",
        strip_prefix = "idna-0.2.0",

        build_file = Label("//3rdparty/cargo/remote:idna-0.2.0.BUILD"),
    )

    _new_http_archive(
        name = "raze__indexmap__1_3_2",
        url = "https://crates-io.s3-us-west-1.amazonaws.com/crates/indexmap/indexmap-1.3.2.crate",
        type = "tar.gz",
        strip_prefix = "indexmap-1.3.2",

        build_file = Label("//3rdparty/cargo/remote:indexmap-1.3.2.BUILD"),
    )

    _new_http_archive(
        name = "raze__iovec__0_1_4",
        url = "https://crates-io.s3-us-west-1.amazonaws.com/crates/iovec/iovec-0.1.4.crate",
        type = "tar.gz",
        strip_prefix = "iovec-0.1.4",

        build_file = Label("//3rdparty/cargo/remote:iovec-0.1.4.BUILD"),
    )

    _new_http_archive(
        name = "raze__itoa__0_3_4",
        url = "https://crates-io.s3-us-west-1.amazonaws.com/crates/itoa/itoa-0.3.4.crate",
        type = "tar.gz",
        strip_prefix = "itoa-0.3.4",

        build_file = Label("//3rdparty/cargo/remote:itoa-0.3.4.BUILD"),
    )

    _new_http_archive(
        name = "raze__itoa__0_4_5",
        url = "https://crates-io.s3-us-west-1.amazonaws.com/crates/itoa/itoa-0.4.5.crate",
        type = "tar.gz",
        strip_prefix = "itoa-0.4.5",

        build_file = Label("//3rdparty/cargo/remote:itoa-0.4.5.BUILD"),
    )

    _new_http_archive(
        name = "raze__js_sys__0_3_35",
        url = "https://crates-io.s3-us-west-1.amazonaws.com/crates/js-sys/js-sys-0.3.35.crate",
        type = "tar.gz",
        strip_prefix = "js-sys-0.3.35",

        build_file = Label("//3rdparty/cargo/remote:js-sys-0.3.35.BUILD"),
    )

    _new_http_archive(
        name = "raze__kernel32_sys__0_2_2",
        url = "https://crates-io.s3-us-west-1.amazonaws.com/crates/kernel32-sys/kernel32-sys-0.2.2.crate",
        type = "tar.gz",
        strip_prefix = "kernel32-sys-0.2.2",

        build_file = Label("//3rdparty/cargo/remote:kernel32-sys-0.2.2.BUILD"),
    )

    _new_http_archive(
        name = "raze__language_tags__0_2_2",
        url = "https://crates-io.s3-us-west-1.amazonaws.com/crates/language-tags/language-tags-0.2.2.crate",
        type = "tar.gz",
        strip_prefix = "language-tags-0.2.2",

        build_file = Label("//3rdparty/cargo/remote:language-tags-0.2.2.BUILD"),
    )

    _new_http_archive(
        name = "raze__lazy_static__0_2_11",
        url = "https://crates-io.s3-us-west-1.amazonaws.com/crates/lazy_static/lazy_static-0.2.11.crate",
        type = "tar.gz",
        strip_prefix = "lazy_static-0.2.11",

        build_file = Label("//3rdparty/cargo/remote:lazy_static-0.2.11.BUILD"),
    )

    _new_http_archive(
        name = "raze__lazy_static__1_4_0",
        url = "https://crates-io.s3-us-west-1.amazonaws.com/crates/lazy_static/lazy_static-1.4.0.crate",
        type = "tar.gz",
        strip_prefix = "lazy_static-1.4.0",

        build_file = Label("//3rdparty/cargo/remote:lazy_static-1.4.0.BUILD"),
    )

    _new_http_archive(
        name = "raze__libc__0_2_67",
        url = "https://crates-io.s3-us-west-1.amazonaws.com/crates/libc/libc-0.2.67.crate",
        type = "tar.gz",
        strip_prefix = "libc-0.2.67",

        build_file = Label("//3rdparty/cargo/remote:libc-0.2.67.BUILD"),
    )

    _new_http_archive(
        name = "raze__libflate__0_1_27",
        url = "https://crates-io.s3-us-west-1.amazonaws.com/crates/libflate/libflate-0.1.27.crate",
        type = "tar.gz",
        strip_prefix = "libflate-0.1.27",

        build_file = Label("//3rdparty/cargo/remote:libflate-0.1.27.BUILD"),
    )

    _new_http_archive(
        name = "raze__linked_hash_map__0_3_0",
        url = "https://crates-io.s3-us-west-1.amazonaws.com/crates/linked-hash-map/linked-hash-map-0.3.0.crate",
        type = "tar.gz",
        strip_prefix = "linked-hash-map-0.3.0",

        build_file = Label("//3rdparty/cargo/remote:linked-hash-map-0.3.0.BUILD"),
    )

    _new_http_archive(
        name = "raze__linked_hash_map__0_5_2",
        url = "https://crates-io.s3-us-west-1.amazonaws.com/crates/linked-hash-map/linked-hash-map-0.5.2.crate",
        type = "tar.gz",
        strip_prefix = "linked-hash-map-0.5.2",

        build_file = Label("//3rdparty/cargo/remote:linked-hash-map-0.5.2.BUILD"),
    )

    _new_http_archive(
        name = "raze__lock_api__0_3_3",
        url = "https://crates-io.s3-us-west-1.amazonaws.com/crates/lock_api/lock_api-0.3.3.crate",
        type = "tar.gz",
        strip_prefix = "lock_api-0.3.3",

        build_file = Label("//3rdparty/cargo/remote:lock_api-0.3.3.BUILD"),
    )

    _new_http_archive(
        name = "raze__log__0_3_9",
        url = "https://crates-io.s3-us-west-1.amazonaws.com/crates/log/log-0.3.9.crate",
        type = "tar.gz",
        strip_prefix = "log-0.3.9",

        build_file = Label("//3rdparty/cargo/remote:log-0.3.9.BUILD"),
    )

    _new_http_archive(
        name = "raze__log__0_4_8",
        url = "https://crates-io.s3-us-west-1.amazonaws.com/crates/log/log-0.4.8.crate",
        type = "tar.gz",
        strip_prefix = "log-0.4.8",

        build_file = Label("//3rdparty/cargo/remote:log-0.4.8.BUILD"),
    )

    _new_http_archive(
        name = "raze__matches__0_1_8",
        url = "https://crates-io.s3-us-west-1.amazonaws.com/crates/matches/matches-0.1.8.crate",
        type = "tar.gz",
        strip_prefix = "matches-0.1.8",

        build_file = Label("//3rdparty/cargo/remote:matches-0.1.8.BUILD"),
    )

    _new_http_archive(
        name = "raze__maybe_uninit__2_0_0",
        url = "https://crates-io.s3-us-west-1.amazonaws.com/crates/maybe-uninit/maybe-uninit-2.0.0.crate",
        type = "tar.gz",
        strip_prefix = "maybe-uninit-2.0.0",

        build_file = Label("//3rdparty/cargo/remote:maybe-uninit-2.0.0.BUILD"),
    )

    _new_http_archive(
        name = "raze__memchr__2_3_2",
        url = "https://crates-io.s3-us-west-1.amazonaws.com/crates/memchr/memchr-2.3.2.crate",
        type = "tar.gz",
        strip_prefix = "memchr-2.3.2",

        build_file = Label("//3rdparty/cargo/remote:memchr-2.3.2.BUILD"),
    )

    _new_http_archive(
        name = "raze__memoffset__0_5_3",
        url = "https://crates-io.s3-us-west-1.amazonaws.com/crates/memoffset/memoffset-0.5.3.crate",
        type = "tar.gz",
        strip_prefix = "memoffset-0.5.3",

        build_file = Label("//3rdparty/cargo/remote:memoffset-0.5.3.BUILD"),
    )

    _new_http_archive(
        name = "raze__mime__0_2_6",
        url = "https://crates-io.s3-us-west-1.amazonaws.com/crates/mime/mime-0.2.6.crate",
        type = "tar.gz",
        strip_prefix = "mime-0.2.6",

        build_file = Label("//3rdparty/cargo/remote:mime-0.2.6.BUILD"),
    )

    _new_http_archive(
        name = "raze__mime__0_3_16",
        url = "https://crates-io.s3-us-west-1.amazonaws.com/crates/mime/mime-0.3.16.crate",
        type = "tar.gz",
        strip_prefix = "mime-0.3.16",

        build_file = Label("//3rdparty/cargo/remote:mime-0.3.16.BUILD"),
    )

    _new_http_archive(
        name = "raze__mime_guess__2_0_1",
        url = "https://crates-io.s3-us-west-1.amazonaws.com/crates/mime_guess/mime_guess-2.0.1.crate",
        type = "tar.gz",
        strip_prefix = "mime_guess-2.0.1",

        build_file = Label("//3rdparty/cargo/remote:mime_guess-2.0.1.BUILD"),
    )

    _new_http_archive(
        name = "raze__miniz_oxide__0_3_6",
        url = "https://crates-io.s3-us-west-1.amazonaws.com/crates/miniz_oxide/miniz_oxide-0.3.6.crate",
        type = "tar.gz",
        strip_prefix = "miniz_oxide-0.3.6",

        build_file = Label("//3rdparty/cargo/remote:miniz_oxide-0.3.6.BUILD"),
    )

    _new_http_archive(
        name = "raze__mio__0_6_21",
        url = "https://crates-io.s3-us-west-1.amazonaws.com/crates/mio/mio-0.6.21.crate",
        type = "tar.gz",
        strip_prefix = "mio-0.6.21",

        build_file = Label("//3rdparty/cargo/remote:mio-0.6.21.BUILD"),
    )

    _new_http_archive(
        name = "raze__miow__0_2_1",
        url = "https://crates-io.s3-us-west-1.amazonaws.com/crates/miow/miow-0.2.1.crate",
        type = "tar.gz",
        strip_prefix = "miow-0.2.1",

        build_file = Label("//3rdparty/cargo/remote:miow-0.2.1.BUILD"),
    )

    _new_http_archive(
        name = "raze__native_tls__0_1_5",
        url = "https://crates-io.s3-us-west-1.amazonaws.com/crates/native-tls/native-tls-0.1.5.crate",
        type = "tar.gz",
        strip_prefix = "native-tls-0.1.5",

        build_file = Label("//3rdparty/cargo/remote:native-tls-0.1.5.BUILD"),
    )

    _new_http_archive(
        name = "raze__native_tls__0_2_3",
        url = "https://crates-io.s3-us-west-1.amazonaws.com/crates/native-tls/native-tls-0.2.3.crate",
        type = "tar.gz",
        strip_prefix = "native-tls-0.2.3",

        build_file = Label("//3rdparty/cargo/remote:native-tls-0.2.3.BUILD"),
    )

    _new_http_archive(
        name = "raze__net2__0_2_33",
        url = "https://crates-io.s3-us-west-1.amazonaws.com/crates/net2/net2-0.2.33.crate",
        type = "tar.gz",
        strip_prefix = "net2-0.2.33",

        build_file = Label("//3rdparty/cargo/remote:net2-0.2.33.BUILD"),
    )

    _new_http_archive(
        name = "raze__nom__4_2_3",
        url = "https://crates-io.s3-us-west-1.amazonaws.com/crates/nom/nom-4.2.3.crate",
        type = "tar.gz",
        strip_prefix = "nom-4.2.3",

        build_file = Label("//3rdparty/cargo/remote:nom-4.2.3.BUILD"),
    )

    _new_http_archive(
        name = "raze__num_traits__0_1_43",
        url = "https://crates-io.s3-us-west-1.amazonaws.com/crates/num-traits/num-traits-0.1.43.crate",
        type = "tar.gz",
        strip_prefix = "num-traits-0.1.43",

        build_file = Label("//3rdparty/cargo/remote:num-traits-0.1.43.BUILD"),
    )

    _new_http_archive(
        name = "raze__num_traits__0_2_11",
        url = "https://crates-io.s3-us-west-1.amazonaws.com/crates/num-traits/num-traits-0.2.11.crate",
        type = "tar.gz",
        strip_prefix = "num-traits-0.2.11",

        build_file = Label("//3rdparty/cargo/remote:num-traits-0.2.11.BUILD"),
    )

    _new_http_archive(
        name = "raze__num_cpus__1_12_0",
        url = "https://crates-io.s3-us-west-1.amazonaws.com/crates/num_cpus/num_cpus-1.12.0.crate",
        type = "tar.gz",
        strip_prefix = "num_cpus-1.12.0",

        build_file = Label("//3rdparty/cargo/remote:num_cpus-1.12.0.BUILD"),
    )

    _new_http_archive(
        name = "raze__oauth_client__0_3_2",
        url = "https://crates-io.s3-us-west-1.amazonaws.com/crates/oauth-client/oauth-client-0.3.2.crate",
        type = "tar.gz",
        strip_prefix = "oauth-client-0.3.2",

        build_file = Label("//3rdparty/cargo/remote:oauth-client-0.3.2.BUILD"),
    )

    _new_git_repository(
        name = "raze__oauth1__1_0_0",
        remote = "https://github.com/mehcode/oauth1-rs",
        commit = "2b6ae40f993e5a2159981a2e751a397ada4627c8",
        build_file = Label("//3rdparty/cargo/remote:oauth1-1.0.0.BUILD"),
        init_submodules = True,
)

    _new_http_archive(
        name = "raze__openssl__0_10_28",
        url = "https://crates-io.s3-us-west-1.amazonaws.com/crates/openssl/openssl-0.10.28.crate",
        type = "tar.gz",
        strip_prefix = "openssl-0.10.28",

        build_file = Label("//3rdparty/cargo/remote:openssl-0.10.28.BUILD"),
    )

    _new_http_archive(
        name = "raze__openssl__0_9_24",
        url = "https://crates-io.s3-us-west-1.amazonaws.com/crates/openssl/openssl-0.9.24.crate",
        type = "tar.gz",
        strip_prefix = "openssl-0.9.24",

        build_file = Label("//3rdparty/cargo/remote:openssl-0.9.24.BUILD"),
    )

    _new_http_archive(
        name = "raze__openssl_probe__0_1_2",
        url = "https://crates-io.s3-us-west-1.amazonaws.com/crates/openssl-probe/openssl-probe-0.1.2.crate",
        type = "tar.gz",
        strip_prefix = "openssl-probe-0.1.2",

        build_file = Label("//3rdparty/cargo/remote:openssl-probe-0.1.2.BUILD"),
    )

    _new_http_archive(
        name = "raze__openssl_sys__0_9_54",
        url = "https://crates-io.s3-us-west-1.amazonaws.com/crates/openssl-sys/openssl-sys-0.9.54.crate",
        type = "tar.gz",
        strip_prefix = "openssl-sys-0.9.54",

        build_file = Label("//3rdparty/cargo/remote:openssl-sys-0.9.54.BUILD"),
    )

    _new_http_archive(
        name = "raze__parking_lot__0_9_0",
        url = "https://crates-io.s3-us-west-1.amazonaws.com/crates/parking_lot/parking_lot-0.9.0.crate",
        type = "tar.gz",
        strip_prefix = "parking_lot-0.9.0",

        build_file = Label("//3rdparty/cargo/remote:parking_lot-0.9.0.BUILD"),
    )

    _new_http_archive(
        name = "raze__parking_lot_core__0_6_2",
        url = "https://crates-io.s3-us-west-1.amazonaws.com/crates/parking_lot_core/parking_lot_core-0.6.2.crate",
        type = "tar.gz",
        strip_prefix = "parking_lot_core-0.6.2",

        build_file = Label("//3rdparty/cargo/remote:parking_lot_core-0.6.2.BUILD"),
    )

    _new_http_archive(
        name = "raze__percent_encoding__1_0_1",
        url = "https://crates-io.s3-us-west-1.amazonaws.com/crates/percent-encoding/percent-encoding-1.0.1.crate",
        type = "tar.gz",
        strip_prefix = "percent-encoding-1.0.1",

        build_file = Label("//3rdparty/cargo/remote:percent-encoding-1.0.1.BUILD"),
    )

    _new_http_archive(
        name = "raze__percent_encoding__2_1_0",
        url = "https://crates-io.s3-us-west-1.amazonaws.com/crates/percent-encoding/percent-encoding-2.1.0.crate",
        type = "tar.gz",
        strip_prefix = "percent-encoding-2.1.0",

        build_file = Label("//3rdparty/cargo/remote:percent-encoding-2.1.0.BUILD"),
    )

    _new_http_archive(
        name = "raze__pkg_config__0_3_17",
        url = "https://crates-io.s3-us-west-1.amazonaws.com/crates/pkg-config/pkg-config-0.3.17.crate",
        type = "tar.gz",
        strip_prefix = "pkg-config-0.3.17",

        build_file = Label("//3rdparty/cargo/remote:pkg-config-0.3.17.BUILD"),
    )

    _new_http_archive(
        name = "raze__ppv_lite86__0_2_6",
        url = "https://crates-io.s3-us-west-1.amazonaws.com/crates/ppv-lite86/ppv-lite86-0.2.6.crate",
        type = "tar.gz",
        strip_prefix = "ppv-lite86-0.2.6",

        build_file = Label("//3rdparty/cargo/remote:ppv-lite86-0.2.6.BUILD"),
    )

    _new_http_archive(
        name = "raze__proc_macro_hack__0_5_11",
        url = "https://crates-io.s3-us-west-1.amazonaws.com/crates/proc-macro-hack/proc-macro-hack-0.5.11.crate",
        type = "tar.gz",
        strip_prefix = "proc-macro-hack-0.5.11",

        build_file = Label("//3rdparty/cargo/remote:proc-macro-hack-0.5.11.BUILD"),
    )

    _new_http_archive(
        name = "raze__proc_macro2__0_4_30",
        url = "https://crates-io.s3-us-west-1.amazonaws.com/crates/proc-macro2/proc-macro2-0.4.30.crate",
        type = "tar.gz",
        strip_prefix = "proc-macro2-0.4.30",

        build_file = Label("//3rdparty/cargo/remote:proc-macro2-0.4.30.BUILD"),
    )

    _new_http_archive(
        name = "raze__proc_macro2__1_0_8",
        url = "https://crates-io.s3-us-west-1.amazonaws.com/crates/proc-macro2/proc-macro2-1.0.8.crate",
        type = "tar.gz",
        strip_prefix = "proc-macro2-1.0.8",

        build_file = Label("//3rdparty/cargo/remote:proc-macro2-1.0.8.BUILD"),
    )

    _new_http_archive(
        name = "raze__publicsuffix__1_5_4",
        url = "https://crates-io.s3-us-west-1.amazonaws.com/crates/publicsuffix/publicsuffix-1.5.4.crate",
        type = "tar.gz",
        strip_prefix = "publicsuffix-1.5.4",

        build_file = Label("//3rdparty/cargo/remote:publicsuffix-1.5.4.BUILD"),
    )

    _new_http_archive(
        name = "raze__quote__0_6_13",
        url = "https://crates-io.s3-us-west-1.amazonaws.com/crates/quote/quote-0.6.13.crate",
        type = "tar.gz",
        strip_prefix = "quote-0.6.13",

        build_file = Label("//3rdparty/cargo/remote:quote-0.6.13.BUILD"),
    )

    _new_http_archive(
        name = "raze__quote__1_0_2",
        url = "https://crates-io.s3-us-west-1.amazonaws.com/crates/quote/quote-1.0.2.crate",
        type = "tar.gz",
        strip_prefix = "quote-1.0.2",

        build_file = Label("//3rdparty/cargo/remote:quote-1.0.2.BUILD"),
    )

    _new_http_archive(
        name = "raze__rand__0_3_23",
        url = "https://crates-io.s3-us-west-1.amazonaws.com/crates/rand/rand-0.3.23.crate",
        type = "tar.gz",
        strip_prefix = "rand-0.3.23",

        build_file = Label("//3rdparty/cargo/remote:rand-0.3.23.BUILD"),
    )

    _new_http_archive(
        name = "raze__rand__0_4_6",
        url = "https://crates-io.s3-us-west-1.amazonaws.com/crates/rand/rand-0.4.6.crate",
        type = "tar.gz",
        strip_prefix = "rand-0.4.6",

        build_file = Label("//3rdparty/cargo/remote:rand-0.4.6.BUILD"),
    )

    _new_http_archive(
        name = "raze__rand__0_6_5",
        url = "https://crates-io.s3-us-west-1.amazonaws.com/crates/rand/rand-0.6.5.crate",
        type = "tar.gz",
        strip_prefix = "rand-0.6.5",

        build_file = Label("//3rdparty/cargo/remote:rand-0.6.5.BUILD"),
    )

    _new_http_archive(
        name = "raze__rand__0_7_3",
        url = "https://crates-io.s3-us-west-1.amazonaws.com/crates/rand/rand-0.7.3.crate",
        type = "tar.gz",
        strip_prefix = "rand-0.7.3",

        build_file = Label("//3rdparty/cargo/remote:rand-0.7.3.BUILD"),
    )

    _new_http_archive(
        name = "raze__rand_chacha__0_1_1",
        url = "https://crates-io.s3-us-west-1.amazonaws.com/crates/rand_chacha/rand_chacha-0.1.1.crate",
        type = "tar.gz",
        strip_prefix = "rand_chacha-0.1.1",

        build_file = Label("//3rdparty/cargo/remote:rand_chacha-0.1.1.BUILD"),
    )

    _new_http_archive(
        name = "raze__rand_chacha__0_2_1",
        url = "https://crates-io.s3-us-west-1.amazonaws.com/crates/rand_chacha/rand_chacha-0.2.1.crate",
        type = "tar.gz",
        strip_prefix = "rand_chacha-0.2.1",

        build_file = Label("//3rdparty/cargo/remote:rand_chacha-0.2.1.BUILD"),
    )

    _new_http_archive(
        name = "raze__rand_core__0_3_1",
        url = "https://crates-io.s3-us-west-1.amazonaws.com/crates/rand_core/rand_core-0.3.1.crate",
        type = "tar.gz",
        strip_prefix = "rand_core-0.3.1",

        build_file = Label("//3rdparty/cargo/remote:rand_core-0.3.1.BUILD"),
    )

    _new_http_archive(
        name = "raze__rand_core__0_4_2",
        url = "https://crates-io.s3-us-west-1.amazonaws.com/crates/rand_core/rand_core-0.4.2.crate",
        type = "tar.gz",
        strip_prefix = "rand_core-0.4.2",

        build_file = Label("//3rdparty/cargo/remote:rand_core-0.4.2.BUILD"),
    )

    _new_http_archive(
        name = "raze__rand_core__0_5_1",
        url = "https://crates-io.s3-us-west-1.amazonaws.com/crates/rand_core/rand_core-0.5.1.crate",
        type = "tar.gz",
        strip_prefix = "rand_core-0.5.1",

        build_file = Label("//3rdparty/cargo/remote:rand_core-0.5.1.BUILD"),
    )

    _new_http_archive(
        name = "raze__rand_hc__0_1_0",
        url = "https://crates-io.s3-us-west-1.amazonaws.com/crates/rand_hc/rand_hc-0.1.0.crate",
        type = "tar.gz",
        strip_prefix = "rand_hc-0.1.0",

        build_file = Label("//3rdparty/cargo/remote:rand_hc-0.1.0.BUILD"),
    )

    _new_http_archive(
        name = "raze__rand_hc__0_2_0",
        url = "https://crates-io.s3-us-west-1.amazonaws.com/crates/rand_hc/rand_hc-0.2.0.crate",
        type = "tar.gz",
        strip_prefix = "rand_hc-0.2.0",

        build_file = Label("//3rdparty/cargo/remote:rand_hc-0.2.0.BUILD"),
    )

    _new_http_archive(
        name = "raze__rand_isaac__0_1_1",
        url = "https://crates-io.s3-us-west-1.amazonaws.com/crates/rand_isaac/rand_isaac-0.1.1.crate",
        type = "tar.gz",
        strip_prefix = "rand_isaac-0.1.1",

        build_file = Label("//3rdparty/cargo/remote:rand_isaac-0.1.1.BUILD"),
    )

    _new_http_archive(
        name = "raze__rand_jitter__0_1_4",
        url = "https://crates-io.s3-us-west-1.amazonaws.com/crates/rand_jitter/rand_jitter-0.1.4.crate",
        type = "tar.gz",
        strip_prefix = "rand_jitter-0.1.4",

        build_file = Label("//3rdparty/cargo/remote:rand_jitter-0.1.4.BUILD"),
    )

    _new_http_archive(
        name = "raze__rand_os__0_1_3",
        url = "https://crates-io.s3-us-west-1.amazonaws.com/crates/rand_os/rand_os-0.1.3.crate",
        type = "tar.gz",
        strip_prefix = "rand_os-0.1.3",

        build_file = Label("//3rdparty/cargo/remote:rand_os-0.1.3.BUILD"),
    )

    _new_http_archive(
        name = "raze__rand_pcg__0_1_2",
        url = "https://crates-io.s3-us-west-1.amazonaws.com/crates/rand_pcg/rand_pcg-0.1.2.crate",
        type = "tar.gz",
        strip_prefix = "rand_pcg-0.1.2",

        build_file = Label("//3rdparty/cargo/remote:rand_pcg-0.1.2.BUILD"),
    )

    _new_http_archive(
        name = "raze__rand_xorshift__0_1_1",
        url = "https://crates-io.s3-us-west-1.amazonaws.com/crates/rand_xorshift/rand_xorshift-0.1.1.crate",
        type = "tar.gz",
        strip_prefix = "rand_xorshift-0.1.1",

        build_file = Label("//3rdparty/cargo/remote:rand_xorshift-0.1.1.BUILD"),
    )

    _new_http_archive(
        name = "raze__rdrand__0_4_0",
        url = "https://crates-io.s3-us-west-1.amazonaws.com/crates/rdrand/rdrand-0.4.0.crate",
        type = "tar.gz",
        strip_prefix = "rdrand-0.4.0",

        build_file = Label("//3rdparty/cargo/remote:rdrand-0.4.0.BUILD"),
    )

    _new_http_archive(
        name = "raze__redox_syscall__0_1_56",
        url = "https://crates-io.s3-us-west-1.amazonaws.com/crates/redox_syscall/redox_syscall-0.1.56.crate",
        type = "tar.gz",
        strip_prefix = "redox_syscall-0.1.56",

        build_file = Label("//3rdparty/cargo/remote:redox_syscall-0.1.56.BUILD"),
    )

    _new_http_archive(
        name = "raze__redox_users__0_3_4",
        url = "https://crates-io.s3-us-west-1.amazonaws.com/crates/redox_users/redox_users-0.3.4.crate",
        type = "tar.gz",
        strip_prefix = "redox_users-0.3.4",

        build_file = Label("//3rdparty/cargo/remote:redox_users-0.3.4.BUILD"),
    )

    _new_http_archive(
        name = "raze__regex__1_3_4",
        url = "https://crates-io.s3-us-west-1.amazonaws.com/crates/regex/regex-1.3.4.crate",
        type = "tar.gz",
        strip_prefix = "regex-1.3.4",

        build_file = Label("//3rdparty/cargo/remote:regex-1.3.4.BUILD"),
    )

    _new_http_archive(
        name = "raze__regex_syntax__0_6_14",
        url = "https://crates-io.s3-us-west-1.amazonaws.com/crates/regex-syntax/regex-syntax-0.6.14.crate",
        type = "tar.gz",
        strip_prefix = "regex-syntax-0.6.14",

        build_file = Label("//3rdparty/cargo/remote:regex-syntax-0.6.14.BUILD"),
    )

    _new_http_archive(
        name = "raze__remove_dir_all__0_5_2",
        url = "https://crates-io.s3-us-west-1.amazonaws.com/crates/remove_dir_all/remove_dir_all-0.5.2.crate",
        type = "tar.gz",
        strip_prefix = "remove_dir_all-0.5.2",

        build_file = Label("//3rdparty/cargo/remote:remove_dir_all-0.5.2.BUILD"),
    )

    _new_http_archive(
        name = "raze__reqwest__0_5_2",
        url = "https://crates-io.s3-us-west-1.amazonaws.com/crates/reqwest/reqwest-0.5.2.crate",
        type = "tar.gz",
        strip_prefix = "reqwest-0.5.2",

        build_file = Label("//3rdparty/cargo/remote:reqwest-0.5.2.BUILD"),
    )

    _new_http_archive(
        name = "raze__reqwest__0_9_24",
        url = "https://crates-io.s3-us-west-1.amazonaws.com/crates/reqwest/reqwest-0.9.24.crate",
        type = "tar.gz",
        strip_prefix = "reqwest-0.9.24",

        build_file = Label("//3rdparty/cargo/remote:reqwest-0.9.24.BUILD"),
    )

    _new_http_archive(
        name = "raze__ring__0_16_11",
        url = "https://crates-io.s3-us-west-1.amazonaws.com/crates/ring/ring-0.16.11.crate",
        type = "tar.gz",
        strip_prefix = "ring-0.16.11",

        build_file = Label("//3rdparty/cargo/remote:ring-0.16.11.BUILD"),
    )

    _new_http_archive(
        name = "raze__rle_decode_fast__1_0_1",
        url = "https://crates-io.s3-us-west-1.amazonaws.com/crates/rle-decode-fast/rle-decode-fast-1.0.1.crate",
        type = "tar.gz",
        strip_prefix = "rle-decode-fast-1.0.1",

        build_file = Label("//3rdparty/cargo/remote:rle-decode-fast-1.0.1.BUILD"),
    )

    _new_http_archive(
        name = "raze__roxmltree__0_6_1",
        url = "https://crates-io.s3-us-west-1.amazonaws.com/crates/roxmltree/roxmltree-0.6.1.crate",
        type = "tar.gz",
        strip_prefix = "roxmltree-0.6.1",

        build_file = Label("//3rdparty/cargo/remote:roxmltree-0.6.1.BUILD"),
    )

    _new_http_archive(
        name = "raze__rust_argon2__0_7_0",
        url = "https://crates-io.s3-us-west-1.amazonaws.com/crates/rust-argon2/rust-argon2-0.7.0.crate",
        type = "tar.gz",
        strip_prefix = "rust-argon2-0.7.0",

        build_file = Label("//3rdparty/cargo/remote:rust-argon2-0.7.0.BUILD"),
    )

    _new_http_archive(
        name = "raze__rust_crypto__0_2_36",
        url = "https://crates-io.s3-us-west-1.amazonaws.com/crates/rust-crypto/rust-crypto-0.2.36.crate",
        type = "tar.gz",
        strip_prefix = "rust-crypto-0.2.36",

        build_file = Label("//3rdparty/cargo/remote:rust-crypto-0.2.36.BUILD"),
    )

    _new_http_archive(
        name = "raze__rust_ini__0_13_0",
        url = "https://crates-io.s3-us-west-1.amazonaws.com/crates/rust-ini/rust-ini-0.13.0.crate",
        type = "tar.gz",
        strip_prefix = "rust-ini-0.13.0",

        build_file = Label("//3rdparty/cargo/remote:rust-ini-0.13.0.BUILD"),
    )

    _new_http_archive(
        name = "raze__rustc_demangle__0_1_16",
        url = "https://crates-io.s3-us-west-1.amazonaws.com/crates/rustc-demangle/rustc-demangle-0.1.16.crate",
        type = "tar.gz",
        strip_prefix = "rustc-demangle-0.1.16",

        build_file = Label("//3rdparty/cargo/remote:rustc-demangle-0.1.16.BUILD"),
    )

    _new_http_archive(
        name = "raze__rustc_serialize__0_3_24",
        url = "https://crates-io.s3-us-west-1.amazonaws.com/crates/rustc-serialize/rustc-serialize-0.3.24.crate",
        type = "tar.gz",
        strip_prefix = "rustc-serialize-0.3.24",

        build_file = Label("//3rdparty/cargo/remote:rustc-serialize-0.3.24.BUILD"),
    )

    _new_http_archive(
        name = "raze__rustc_version__0_2_3",
        url = "https://crates-io.s3-us-west-1.amazonaws.com/crates/rustc_version/rustc_version-0.2.3.crate",
        type = "tar.gz",
        strip_prefix = "rustc_version-0.2.3",

        build_file = Label("//3rdparty/cargo/remote:rustc_version-0.2.3.BUILD"),
    )

    _new_http_archive(
        name = "raze__rustversion__1_0_2",
        url = "https://crates-io.s3-us-west-1.amazonaws.com/crates/rustversion/rustversion-1.0.2.crate",
        type = "tar.gz",
        strip_prefix = "rustversion-1.0.2",

        build_file = Label("//3rdparty/cargo/remote:rustversion-1.0.2.BUILD"),
    )

    _new_http_archive(
        name = "raze__ryu__1_0_2",
        url = "https://crates-io.s3-us-west-1.amazonaws.com/crates/ryu/ryu-1.0.2.crate",
        type = "tar.gz",
        strip_prefix = "ryu-1.0.2",

        build_file = Label("//3rdparty/cargo/remote:ryu-1.0.2.BUILD"),
    )

    _new_http_archive(
        name = "raze__safemem__0_3_3",
        url = "https://crates-io.s3-us-west-1.amazonaws.com/crates/safemem/safemem-0.3.3.crate",
        type = "tar.gz",
        strip_prefix = "safemem-0.3.3",

        build_file = Label("//3rdparty/cargo/remote:safemem-0.3.3.BUILD"),
    )

    _new_http_archive(
        name = "raze__schannel__0_1_17",
        url = "https://crates-io.s3-us-west-1.amazonaws.com/crates/schannel/schannel-0.1.17.crate",
        type = "tar.gz",
        strip_prefix = "schannel-0.1.17",

        build_file = Label("//3rdparty/cargo/remote:schannel-0.1.17.BUILD"),
    )

    _new_http_archive(
        name = "raze__scopeguard__1_1_0",
        url = "https://crates-io.s3-us-west-1.amazonaws.com/crates/scopeguard/scopeguard-1.1.0.crate",
        type = "tar.gz",
        strip_prefix = "scopeguard-1.1.0",

        build_file = Label("//3rdparty/cargo/remote:scopeguard-1.1.0.BUILD"),
    )

    _new_http_archive(
        name = "raze__security_framework__0_1_16",
        url = "https://crates-io.s3-us-west-1.amazonaws.com/crates/security-framework/security-framework-0.1.16.crate",
        type = "tar.gz",
        strip_prefix = "security-framework-0.1.16",

        build_file = Label("//3rdparty/cargo/remote:security-framework-0.1.16.BUILD"),
    )

    _new_http_archive(
        name = "raze__security_framework__0_3_4",
        url = "https://crates-io.s3-us-west-1.amazonaws.com/crates/security-framework/security-framework-0.3.4.crate",
        type = "tar.gz",
        strip_prefix = "security-framework-0.3.4",

        build_file = Label("//3rdparty/cargo/remote:security-framework-0.3.4.BUILD"),
    )

    _new_http_archive(
        name = "raze__security_framework_sys__0_1_16",
        url = "https://crates-io.s3-us-west-1.amazonaws.com/crates/security-framework-sys/security-framework-sys-0.1.16.crate",
        type = "tar.gz",
        strip_prefix = "security-framework-sys-0.1.16",

        build_file = Label("//3rdparty/cargo/remote:security-framework-sys-0.1.16.BUILD"),
    )

    _new_http_archive(
        name = "raze__security_framework_sys__0_3_3",
        url = "https://crates-io.s3-us-west-1.amazonaws.com/crates/security-framework-sys/security-framework-sys-0.3.3.crate",
        type = "tar.gz",
        strip_prefix = "security-framework-sys-0.3.3",

        build_file = Label("//3rdparty/cargo/remote:security-framework-sys-0.3.3.BUILD"),
    )

    _new_http_archive(
        name = "raze__semver__0_9_0",
        url = "https://crates-io.s3-us-west-1.amazonaws.com/crates/semver/semver-0.9.0.crate",
        type = "tar.gz",
        strip_prefix = "semver-0.9.0",

        build_file = Label("//3rdparty/cargo/remote:semver-0.9.0.BUILD"),
    )

    _new_http_archive(
        name = "raze__semver_parser__0_7_0",
        url = "https://crates-io.s3-us-west-1.amazonaws.com/crates/semver-parser/semver-parser-0.7.0.crate",
        type = "tar.gz",
        strip_prefix = "semver-parser-0.7.0",

        build_file = Label("//3rdparty/cargo/remote:semver-parser-0.7.0.BUILD"),
    )

    _new_http_archive(
        name = "raze__serde__0_8_23",
        url = "https://crates-io.s3-us-west-1.amazonaws.com/crates/serde/serde-0.8.23.crate",
        type = "tar.gz",
        strip_prefix = "serde-0.8.23",

        build_file = Label("//3rdparty/cargo/remote:serde-0.8.23.BUILD"),
    )

    _new_http_archive(
        name = "raze__serde__0_9_15",
        url = "https://crates-io.s3-us-west-1.amazonaws.com/crates/serde/serde-0.9.15.crate",
        type = "tar.gz",
        strip_prefix = "serde-0.9.15",

        build_file = Label("//3rdparty/cargo/remote:serde-0.9.15.BUILD"),
    )

    _new_http_archive(
        name = "raze__serde__1_0_104",
        url = "https://crates-io.s3-us-west-1.amazonaws.com/crates/serde/serde-1.0.104.crate",
        type = "tar.gz",
        strip_prefix = "serde-1.0.104",

        build_file = Label("//3rdparty/cargo/remote:serde-1.0.104.BUILD"),
    )

    _new_http_archive(
        name = "raze__serde_hjson__0_8_2",
        url = "https://crates-io.s3-us-west-1.amazonaws.com/crates/serde-hjson/serde-hjson-0.8.2.crate",
        type = "tar.gz",
        strip_prefix = "serde-hjson-0.8.2",

        build_file = Label("//3rdparty/cargo/remote:serde-hjson-0.8.2.BUILD"),
    )

    _new_http_archive(
        name = "raze__serde_derive__1_0_104",
        url = "https://crates-io.s3-us-west-1.amazonaws.com/crates/serde_derive/serde_derive-1.0.104.crate",
        type = "tar.gz",
        strip_prefix = "serde_derive-1.0.104",

        build_file = Label("//3rdparty/cargo/remote:serde_derive-1.0.104.BUILD"),
    )

    _new_http_archive(
        name = "raze__serde_json__0_9_10",
        url = "https://crates-io.s3-us-west-1.amazonaws.com/crates/serde_json/serde_json-0.9.10.crate",
        type = "tar.gz",
        strip_prefix = "serde_json-0.9.10",

        build_file = Label("//3rdparty/cargo/remote:serde_json-0.9.10.BUILD"),
    )

    _new_http_archive(
        name = "raze__serde_json__1_0_48",
        url = "https://crates-io.s3-us-west-1.amazonaws.com/crates/serde_json/serde_json-1.0.48.crate",
        type = "tar.gz",
        strip_prefix = "serde_json-1.0.48",

        build_file = Label("//3rdparty/cargo/remote:serde_json-1.0.48.BUILD"),
    )

    _new_http_archive(
        name = "raze__serde_test__0_8_23",
        url = "https://crates-io.s3-us-west-1.amazonaws.com/crates/serde_test/serde_test-0.8.23.crate",
        type = "tar.gz",
        strip_prefix = "serde_test-0.8.23",

        build_file = Label("//3rdparty/cargo/remote:serde_test-0.8.23.BUILD"),
    )

    _new_http_archive(
        name = "raze__serde_urlencoded__0_4_3",
        url = "https://crates-io.s3-us-west-1.amazonaws.com/crates/serde_urlencoded/serde_urlencoded-0.4.3.crate",
        type = "tar.gz",
        strip_prefix = "serde_urlencoded-0.4.3",

        build_file = Label("//3rdparty/cargo/remote:serde_urlencoded-0.4.3.BUILD"),
    )

    _new_http_archive(
        name = "raze__serde_urlencoded__0_5_5",
        url = "https://crates-io.s3-us-west-1.amazonaws.com/crates/serde_urlencoded/serde_urlencoded-0.5.5.crate",
        type = "tar.gz",
        strip_prefix = "serde_urlencoded-0.5.5",

        build_file = Label("//3rdparty/cargo/remote:serde_urlencoded-0.5.5.BUILD"),
    )

    _new_http_archive(
        name = "raze__simple_error__0_2_1",
        url = "https://crates-io.s3-us-west-1.amazonaws.com/crates/simple-error/simple-error-0.2.1.crate",
        type = "tar.gz",
        strip_prefix = "simple-error-0.2.1",

        build_file = Label("//3rdparty/cargo/remote:simple-error-0.2.1.BUILD"),
    )

    _new_http_archive(
        name = "raze__slab__0_4_2",
        url = "https://crates-io.s3-us-west-1.amazonaws.com/crates/slab/slab-0.4.2.crate",
        type = "tar.gz",
        strip_prefix = "slab-0.4.2",

        build_file = Label("//3rdparty/cargo/remote:slab-0.4.2.BUILD"),
    )

    _new_http_archive(
        name = "raze__smallvec__0_6_13",
        url = "https://crates-io.s3-us-west-1.amazonaws.com/crates/smallvec/smallvec-0.6.13.crate",
        type = "tar.gz",
        strip_prefix = "smallvec-0.6.13",

        build_file = Label("//3rdparty/cargo/remote:smallvec-0.6.13.BUILD"),
    )

    _new_http_archive(
        name = "raze__smallvec__1_2_0",
        url = "https://crates-io.s3-us-west-1.amazonaws.com/crates/smallvec/smallvec-1.2.0.crate",
        type = "tar.gz",
        strip_prefix = "smallvec-1.2.0",

        build_file = Label("//3rdparty/cargo/remote:smallvec-1.2.0.BUILD"),
    )

    _new_http_archive(
        name = "raze__sourcefile__0_1_4",
        url = "https://crates-io.s3-us-west-1.amazonaws.com/crates/sourcefile/sourcefile-0.1.4.crate",
        type = "tar.gz",
        strip_prefix = "sourcefile-0.1.4",

        build_file = Label("//3rdparty/cargo/remote:sourcefile-0.1.4.BUILD"),
    )

    _new_http_archive(
        name = "raze__spin__0_5_2",
        url = "https://crates-io.s3-us-west-1.amazonaws.com/crates/spin/spin-0.5.2.crate",
        type = "tar.gz",
        strip_prefix = "spin-0.5.2",

        build_file = Label("//3rdparty/cargo/remote:spin-0.5.2.BUILD"),
    )

    _new_http_archive(
        name = "raze__string__0_2_1",
        url = "https://crates-io.s3-us-west-1.amazonaws.com/crates/string/string-0.2.1.crate",
        type = "tar.gz",
        strip_prefix = "string-0.2.1",

        build_file = Label("//3rdparty/cargo/remote:string-0.2.1.BUILD"),
    )

    _new_http_archive(
        name = "raze__strsim__0_8_0",
        url = "https://crates-io.s3-us-west-1.amazonaws.com/crates/strsim/strsim-0.8.0.crate",
        type = "tar.gz",
        strip_prefix = "strsim-0.8.0",

        build_file = Label("//3rdparty/cargo/remote:strsim-0.8.0.BUILD"),
    )

    _new_http_archive(
        name = "raze__structopt__0_2_18",
        url = "https://crates-io.s3-us-west-1.amazonaws.com/crates/structopt/structopt-0.2.18.crate",
        type = "tar.gz",
        strip_prefix = "structopt-0.2.18",

        build_file = Label("//3rdparty/cargo/remote:structopt-0.2.18.BUILD"),
    )

    _new_http_archive(
        name = "raze__structopt_derive__0_2_18",
        url = "https://crates-io.s3-us-west-1.amazonaws.com/crates/structopt-derive/structopt-derive-0.2.18.crate",
        type = "tar.gz",
        strip_prefix = "structopt-derive-0.2.18",

        build_file = Label("//3rdparty/cargo/remote:structopt-derive-0.2.18.BUILD"),
    )

    _new_http_archive(
        name = "raze__syn__0_15_44",
        url = "https://crates-io.s3-us-west-1.amazonaws.com/crates/syn/syn-0.15.44.crate",
        type = "tar.gz",
        strip_prefix = "syn-0.15.44",

        build_file = Label("//3rdparty/cargo/remote:syn-0.15.44.BUILD"),
    )

    _new_http_archive(
        name = "raze__syn__1_0_14",
        url = "https://crates-io.s3-us-west-1.amazonaws.com/crates/syn/syn-1.0.14.crate",
        type = "tar.gz",
        strip_prefix = "syn-1.0.14",

        build_file = Label("//3rdparty/cargo/remote:syn-1.0.14.BUILD"),
    )

    _new_http_archive(
        name = "raze__synstructure__0_12_3",
        url = "https://crates-io.s3-us-west-1.amazonaws.com/crates/synstructure/synstructure-0.12.3.crate",
        type = "tar.gz",
        strip_prefix = "synstructure-0.12.3",

        build_file = Label("//3rdparty/cargo/remote:synstructure-0.12.3.BUILD"),
    )

    _new_http_archive(
        name = "raze__take_mut__0_2_2",
        url = "https://crates-io.s3-us-west-1.amazonaws.com/crates/take_mut/take_mut-0.2.2.crate",
        type = "tar.gz",
        strip_prefix = "take_mut-0.2.2",

        build_file = Label("//3rdparty/cargo/remote:take_mut-0.2.2.BUILD"),
    )

    _new_http_archive(
        name = "raze__tempdir__0_3_7",
        url = "https://crates-io.s3-us-west-1.amazonaws.com/crates/tempdir/tempdir-0.3.7.crate",
        type = "tar.gz",
        strip_prefix = "tempdir-0.3.7",

        build_file = Label("//3rdparty/cargo/remote:tempdir-0.3.7.BUILD"),
    )

    _new_http_archive(
        name = "raze__tempfile__3_1_0",
        url = "https://crates-io.s3-us-west-1.amazonaws.com/crates/tempfile/tempfile-3.1.0.crate",
        type = "tar.gz",
        strip_prefix = "tempfile-3.1.0",

        build_file = Label("//3rdparty/cargo/remote:tempfile-3.1.0.BUILD"),
    )

    _new_http_archive(
        name = "raze__termcolor__1_1_0",
        url = "https://crates-io.s3-us-west-1.amazonaws.com/crates/termcolor/termcolor-1.1.0.crate",
        type = "tar.gz",
        strip_prefix = "termcolor-1.1.0",

        build_file = Label("//3rdparty/cargo/remote:termcolor-1.1.0.BUILD"),
    )

    _new_http_archive(
        name = "raze__textwrap__0_11_0",
        url = "https://crates-io.s3-us-west-1.amazonaws.com/crates/textwrap/textwrap-0.11.0.crate",
        type = "tar.gz",
        strip_prefix = "textwrap-0.11.0",

        build_file = Label("//3rdparty/cargo/remote:textwrap-0.11.0.BUILD"),
    )

    _new_http_archive(
        name = "raze__thread_local__1_0_1",
        url = "https://crates-io.s3-us-west-1.amazonaws.com/crates/thread_local/thread_local-1.0.1.crate",
        type = "tar.gz",
        strip_prefix = "thread_local-1.0.1",

        build_file = Label("//3rdparty/cargo/remote:thread_local-1.0.1.BUILD"),
    )

    _new_http_archive(
        name = "raze__time__0_1_42",
        url = "https://crates-io.s3-us-west-1.amazonaws.com/crates/time/time-0.1.42.crate",
        type = "tar.gz",
        strip_prefix = "time-0.1.42",

        build_file = Label("//3rdparty/cargo/remote:time-0.1.42.BUILD"),
    )

    _new_http_archive(
        name = "raze__time__0_2_6",
        url = "https://crates-io.s3-us-west-1.amazonaws.com/crates/time/time-0.2.6.crate",
        type = "tar.gz",
        strip_prefix = "time-0.2.6",

        build_file = Label("//3rdparty/cargo/remote:time-0.2.6.BUILD"),
    )

    _new_http_archive(
        name = "raze__time_macros__0_1_0",
        url = "https://crates-io.s3-us-west-1.amazonaws.com/crates/time-macros/time-macros-0.1.0.crate",
        type = "tar.gz",
        strip_prefix = "time-macros-0.1.0",

        build_file = Label("//3rdparty/cargo/remote:time-macros-0.1.0.BUILD"),
    )

    _new_http_archive(
        name = "raze__time_macros_impl__0_1_0",
        url = "https://crates-io.s3-us-west-1.amazonaws.com/crates/time-macros-impl/time-macros-impl-0.1.0.crate",
        type = "tar.gz",
        strip_prefix = "time-macros-impl-0.1.0",

        build_file = Label("//3rdparty/cargo/remote:time-macros-impl-0.1.0.BUILD"),
    )

    _new_http_archive(
        name = "raze__tokio__0_1_22",
        url = "https://crates-io.s3-us-west-1.amazonaws.com/crates/tokio/tokio-0.1.22.crate",
        type = "tar.gz",
        strip_prefix = "tokio-0.1.22",

        build_file = Label("//3rdparty/cargo/remote:tokio-0.1.22.BUILD"),
    )

    _new_http_archive(
        name = "raze__tokio_buf__0_1_1",
        url = "https://crates-io.s3-us-west-1.amazonaws.com/crates/tokio-buf/tokio-buf-0.1.1.crate",
        type = "tar.gz",
        strip_prefix = "tokio-buf-0.1.1",

        build_file = Label("//3rdparty/cargo/remote:tokio-buf-0.1.1.BUILD"),
    )

    _new_http_archive(
        name = "raze__tokio_current_thread__0_1_7",
        url = "https://crates-io.s3-us-west-1.amazonaws.com/crates/tokio-current-thread/tokio-current-thread-0.1.7.crate",
        type = "tar.gz",
        strip_prefix = "tokio-current-thread-0.1.7",

        build_file = Label("//3rdparty/cargo/remote:tokio-current-thread-0.1.7.BUILD"),
    )

    _new_http_archive(
        name = "raze__tokio_executor__0_1_10",
        url = "https://crates-io.s3-us-west-1.amazonaws.com/crates/tokio-executor/tokio-executor-0.1.10.crate",
        type = "tar.gz",
        strip_prefix = "tokio-executor-0.1.10",

        build_file = Label("//3rdparty/cargo/remote:tokio-executor-0.1.10.BUILD"),
    )

    _new_http_archive(
        name = "raze__tokio_io__0_1_13",
        url = "https://crates-io.s3-us-west-1.amazonaws.com/crates/tokio-io/tokio-io-0.1.13.crate",
        type = "tar.gz",
        strip_prefix = "tokio-io-0.1.13",

        build_file = Label("//3rdparty/cargo/remote:tokio-io-0.1.13.BUILD"),
    )

    _new_http_archive(
        name = "raze__tokio_reactor__0_1_12",
        url = "https://crates-io.s3-us-west-1.amazonaws.com/crates/tokio-reactor/tokio-reactor-0.1.12.crate",
        type = "tar.gz",
        strip_prefix = "tokio-reactor-0.1.12",

        build_file = Label("//3rdparty/cargo/remote:tokio-reactor-0.1.12.BUILD"),
    )

    _new_http_archive(
        name = "raze__tokio_sync__0_1_8",
        url = "https://crates-io.s3-us-west-1.amazonaws.com/crates/tokio-sync/tokio-sync-0.1.8.crate",
        type = "tar.gz",
        strip_prefix = "tokio-sync-0.1.8",

        build_file = Label("//3rdparty/cargo/remote:tokio-sync-0.1.8.BUILD"),
    )

    _new_http_archive(
        name = "raze__tokio_tcp__0_1_4",
        url = "https://crates-io.s3-us-west-1.amazonaws.com/crates/tokio-tcp/tokio-tcp-0.1.4.crate",
        type = "tar.gz",
        strip_prefix = "tokio-tcp-0.1.4",

        build_file = Label("//3rdparty/cargo/remote:tokio-tcp-0.1.4.BUILD"),
    )

    _new_http_archive(
        name = "raze__tokio_threadpool__0_1_18",
        url = "https://crates-io.s3-us-west-1.amazonaws.com/crates/tokio-threadpool/tokio-threadpool-0.1.18.crate",
        type = "tar.gz",
        strip_prefix = "tokio-threadpool-0.1.18",

        build_file = Label("//3rdparty/cargo/remote:tokio-threadpool-0.1.18.BUILD"),
    )

    _new_http_archive(
        name = "raze__tokio_timer__0_2_13",
        url = "https://crates-io.s3-us-west-1.amazonaws.com/crates/tokio-timer/tokio-timer-0.2.13.crate",
        type = "tar.gz",
        strip_prefix = "tokio-timer-0.2.13",

        build_file = Label("//3rdparty/cargo/remote:tokio-timer-0.2.13.BUILD"),
    )

    _new_http_archive(
        name = "raze__toml__0_4_10",
        url = "https://crates-io.s3-us-west-1.amazonaws.com/crates/toml/toml-0.4.10.crate",
        type = "tar.gz",
        strip_prefix = "toml-0.4.10",

        build_file = Label("//3rdparty/cargo/remote:toml-0.4.10.BUILD"),
    )

    _new_http_archive(
        name = "raze__toml__0_5_6",
        url = "https://crates-io.s3-us-west-1.amazonaws.com/crates/toml/toml-0.5.6.crate",
        type = "tar.gz",
        strip_prefix = "toml-0.5.6",

        build_file = Label("//3rdparty/cargo/remote:toml-0.5.6.BUILD"),
    )

    _new_http_archive(
        name = "raze__traitobject__0_1_0",
        url = "https://crates-io.s3-us-west-1.amazonaws.com/crates/traitobject/traitobject-0.1.0.crate",
        type = "tar.gz",
        strip_prefix = "traitobject-0.1.0",

        build_file = Label("//3rdparty/cargo/remote:traitobject-0.1.0.BUILD"),
    )

    _new_http_archive(
        name = "raze__try_lock__0_2_2",
        url = "https://crates-io.s3-us-west-1.amazonaws.com/crates/try-lock/try-lock-0.2.2.crate",
        type = "tar.gz",
        strip_prefix = "try-lock-0.2.2",

        build_file = Label("//3rdparty/cargo/remote:try-lock-0.2.2.BUILD"),
    )

    _new_http_archive(
        name = "raze__try_from__0_3_2",
        url = "https://crates-io.s3-us-west-1.amazonaws.com/crates/try_from/try_from-0.3.2.crate",
        type = "tar.gz",
        strip_prefix = "try_from-0.3.2",

        build_file = Label("//3rdparty/cargo/remote:try_from-0.3.2.BUILD"),
    )

    _new_http_archive(
        name = "raze__typeable__0_1_2",
        url = "https://crates-io.s3-us-west-1.amazonaws.com/crates/typeable/typeable-0.1.2.crate",
        type = "tar.gz",
        strip_prefix = "typeable-0.1.2",

        build_file = Label("//3rdparty/cargo/remote:typeable-0.1.2.BUILD"),
    )

    _new_http_archive(
        name = "raze__unicase__1_4_2",
        url = "https://crates-io.s3-us-west-1.amazonaws.com/crates/unicase/unicase-1.4.2.crate",
        type = "tar.gz",
        strip_prefix = "unicase-1.4.2",

        build_file = Label("//3rdparty/cargo/remote:unicase-1.4.2.BUILD"),
    )

    _new_http_archive(
        name = "raze__unicase__2_6_0",
        url = "https://crates-io.s3-us-west-1.amazonaws.com/crates/unicase/unicase-2.6.0.crate",
        type = "tar.gz",
        strip_prefix = "unicase-2.6.0",

        build_file = Label("//3rdparty/cargo/remote:unicase-2.6.0.BUILD"),
    )

    _new_http_archive(
        name = "raze__unicode_bidi__0_3_4",
        url = "https://crates-io.s3-us-west-1.amazonaws.com/crates/unicode-bidi/unicode-bidi-0.3.4.crate",
        type = "tar.gz",
        strip_prefix = "unicode-bidi-0.3.4",

        build_file = Label("//3rdparty/cargo/remote:unicode-bidi-0.3.4.BUILD"),
    )

    _new_http_archive(
        name = "raze__unicode_normalization__0_1_12",
        url = "https://crates-io.s3-us-west-1.amazonaws.com/crates/unicode-normalization/unicode-normalization-0.1.12.crate",
        type = "tar.gz",
        strip_prefix = "unicode-normalization-0.1.12",

        build_file = Label("//3rdparty/cargo/remote:unicode-normalization-0.1.12.BUILD"),
    )

    _new_http_archive(
        name = "raze__unicode_segmentation__1_6_0",
        url = "https://crates-io.s3-us-west-1.amazonaws.com/crates/unicode-segmentation/unicode-segmentation-1.6.0.crate",
        type = "tar.gz",
        strip_prefix = "unicode-segmentation-1.6.0",

        build_file = Label("//3rdparty/cargo/remote:unicode-segmentation-1.6.0.BUILD"),
    )

    _new_http_archive(
        name = "raze__unicode_width__0_1_7",
        url = "https://crates-io.s3-us-west-1.amazonaws.com/crates/unicode-width/unicode-width-0.1.7.crate",
        type = "tar.gz",
        strip_prefix = "unicode-width-0.1.7",

        build_file = Label("//3rdparty/cargo/remote:unicode-width-0.1.7.BUILD"),
    )

    _new_http_archive(
        name = "raze__unicode_xid__0_1_0",
        url = "https://crates-io.s3-us-west-1.amazonaws.com/crates/unicode-xid/unicode-xid-0.1.0.crate",
        type = "tar.gz",
        strip_prefix = "unicode-xid-0.1.0",

        build_file = Label("//3rdparty/cargo/remote:unicode-xid-0.1.0.BUILD"),
    )

    _new_http_archive(
        name = "raze__unicode_xid__0_2_0",
        url = "https://crates-io.s3-us-west-1.amazonaws.com/crates/unicode-xid/unicode-xid-0.2.0.crate",
        type = "tar.gz",
        strip_prefix = "unicode-xid-0.2.0",

        build_file = Label("//3rdparty/cargo/remote:unicode-xid-0.2.0.BUILD"),
    )

    _new_http_archive(
        name = "raze__untrusted__0_7_0",
        url = "https://crates-io.s3-us-west-1.amazonaws.com/crates/untrusted/untrusted-0.7.0.crate",
        type = "tar.gz",
        strip_prefix = "untrusted-0.7.0",

        build_file = Label("//3rdparty/cargo/remote:untrusted-0.7.0.BUILD"),
    )

    _new_http_archive(
        name = "raze__url__1_7_2",
        url = "https://crates-io.s3-us-west-1.amazonaws.com/crates/url/url-1.7.2.crate",
        type = "tar.gz",
        strip_prefix = "url-1.7.2",

        build_file = Label("//3rdparty/cargo/remote:url-1.7.2.BUILD"),
    )

    _new_http_archive(
        name = "raze__url__2_1_1",
        url = "https://crates-io.s3-us-west-1.amazonaws.com/crates/url/url-2.1.1.crate",
        type = "tar.gz",
        strip_prefix = "url-2.1.1",

        build_file = Label("//3rdparty/cargo/remote:url-2.1.1.BUILD"),
    )

    _new_http_archive(
        name = "raze__uuid__0_7_4",
        url = "https://crates-io.s3-us-west-1.amazonaws.com/crates/uuid/uuid-0.7.4.crate",
        type = "tar.gz",
        strip_prefix = "uuid-0.7.4",

        build_file = Label("//3rdparty/cargo/remote:uuid-0.7.4.BUILD"),
    )

    _new_http_archive(
        name = "raze__vcpkg__0_2_8",
        url = "https://crates-io.s3-us-west-1.amazonaws.com/crates/vcpkg/vcpkg-0.2.8.crate",
        type = "tar.gz",
        strip_prefix = "vcpkg-0.2.8",

        build_file = Label("//3rdparty/cargo/remote:vcpkg-0.2.8.BUILD"),
    )

    _new_http_archive(
        name = "raze__vec_map__0_8_1",
        url = "https://crates-io.s3-us-west-1.amazonaws.com/crates/vec_map/vec_map-0.8.1.crate",
        type = "tar.gz",
        strip_prefix = "vec_map-0.8.1",

        build_file = Label("//3rdparty/cargo/remote:vec_map-0.8.1.BUILD"),
    )

    _new_http_archive(
        name = "raze__version_check__0_1_5",
        url = "https://crates-io.s3-us-west-1.amazonaws.com/crates/version_check/version_check-0.1.5.crate",
        type = "tar.gz",
        strip_prefix = "version_check-0.1.5",

        build_file = Label("//3rdparty/cargo/remote:version_check-0.1.5.BUILD"),
    )

    _new_http_archive(
        name = "raze__version_check__0_9_1",
        url = "https://crates-io.s3-us-west-1.amazonaws.com/crates/version_check/version_check-0.9.1.crate",
        type = "tar.gz",
        strip_prefix = "version_check-0.9.1",

        build_file = Label("//3rdparty/cargo/remote:version_check-0.9.1.BUILD"),
    )

    _new_http_archive(
        name = "raze__want__0_2_0",
        url = "https://crates-io.s3-us-west-1.amazonaws.com/crates/want/want-0.2.0.crate",
        type = "tar.gz",
        strip_prefix = "want-0.2.0",

        build_file = Label("//3rdparty/cargo/remote:want-0.2.0.BUILD"),
    )

    _new_http_archive(
        name = "raze__wasi__0_9_0_wasi_snapshot_preview1",
        url = "https://crates-io.s3-us-west-1.amazonaws.com/crates/wasi/wasi-0.9.0+wasi-snapshot-preview1.crate",
        type = "tar.gz",
        strip_prefix = "wasi-0.9.0+wasi-snapshot-preview1",

        build_file = Label("//3rdparty/cargo/remote:wasi-0.9.0+wasi-snapshot-preview1.BUILD"),
    )

    _new_http_archive(
        name = "raze__wasm_bindgen__0_2_58",
        url = "https://crates-io.s3-us-west-1.amazonaws.com/crates/wasm-bindgen/wasm-bindgen-0.2.58.crate",
        type = "tar.gz",
        strip_prefix = "wasm-bindgen-0.2.58",

        build_file = Label("//3rdparty/cargo/remote:wasm-bindgen-0.2.58.BUILD"),
    )

    _new_http_archive(
        name = "raze__wasm_bindgen_backend__0_2_58",
        url = "https://crates-io.s3-us-west-1.amazonaws.com/crates/wasm-bindgen-backend/wasm-bindgen-backend-0.2.58.crate",
        type = "tar.gz",
        strip_prefix = "wasm-bindgen-backend-0.2.58",

        build_file = Label("//3rdparty/cargo/remote:wasm-bindgen-backend-0.2.58.BUILD"),
    )

    _new_http_archive(
        name = "raze__wasm_bindgen_macro__0_2_58",
        url = "https://crates-io.s3-us-west-1.amazonaws.com/crates/wasm-bindgen-macro/wasm-bindgen-macro-0.2.58.crate",
        type = "tar.gz",
        strip_prefix = "wasm-bindgen-macro-0.2.58",

        build_file = Label("//3rdparty/cargo/remote:wasm-bindgen-macro-0.2.58.BUILD"),
    )

    _new_http_archive(
        name = "raze__wasm_bindgen_macro_support__0_2_58",
        url = "https://crates-io.s3-us-west-1.amazonaws.com/crates/wasm-bindgen-macro-support/wasm-bindgen-macro-support-0.2.58.crate",
        type = "tar.gz",
        strip_prefix = "wasm-bindgen-macro-support-0.2.58",

        build_file = Label("//3rdparty/cargo/remote:wasm-bindgen-macro-support-0.2.58.BUILD"),
    )

    _new_http_archive(
        name = "raze__wasm_bindgen_shared__0_2_58",
        url = "https://crates-io.s3-us-west-1.amazonaws.com/crates/wasm-bindgen-shared/wasm-bindgen-shared-0.2.58.crate",
        type = "tar.gz",
        strip_prefix = "wasm-bindgen-shared-0.2.58",

        build_file = Label("//3rdparty/cargo/remote:wasm-bindgen-shared-0.2.58.BUILD"),
    )

    _new_http_archive(
        name = "raze__wasm_bindgen_webidl__0_2_58",
        url = "https://crates-io.s3-us-west-1.amazonaws.com/crates/wasm-bindgen-webidl/wasm-bindgen-webidl-0.2.58.crate",
        type = "tar.gz",
        strip_prefix = "wasm-bindgen-webidl-0.2.58",

        build_file = Label("//3rdparty/cargo/remote:wasm-bindgen-webidl-0.2.58.BUILD"),
    )

    _new_http_archive(
        name = "raze__web_sys__0_3_35",
        url = "https://crates-io.s3-us-west-1.amazonaws.com/crates/web-sys/web-sys-0.3.35.crate",
        type = "tar.gz",
        strip_prefix = "web-sys-0.3.35",

        build_file = Label("//3rdparty/cargo/remote:web-sys-0.3.35.BUILD"),
    )

    _new_http_archive(
        name = "raze__weedle__0_10_0",
        url = "https://crates-io.s3-us-west-1.amazonaws.com/crates/weedle/weedle-0.10.0.crate",
        type = "tar.gz",
        strip_prefix = "weedle-0.10.0",

        build_file = Label("//3rdparty/cargo/remote:weedle-0.10.0.BUILD"),
    )

    _new_http_archive(
        name = "raze__winapi__0_2_8",
        url = "https://crates-io.s3-us-west-1.amazonaws.com/crates/winapi/winapi-0.2.8.crate",
        type = "tar.gz",
        strip_prefix = "winapi-0.2.8",

        build_file = Label("//3rdparty/cargo/remote:winapi-0.2.8.BUILD"),
    )

    _new_http_archive(
        name = "raze__winapi__0_3_8",
        url = "https://crates-io.s3-us-west-1.amazonaws.com/crates/winapi/winapi-0.3.8.crate",
        type = "tar.gz",
        strip_prefix = "winapi-0.3.8",

        build_file = Label("//3rdparty/cargo/remote:winapi-0.3.8.BUILD"),
    )

    _new_http_archive(
        name = "raze__winapi_build__0_1_1",
        url = "https://crates-io.s3-us-west-1.amazonaws.com/crates/winapi-build/winapi-build-0.1.1.crate",
        type = "tar.gz",
        strip_prefix = "winapi-build-0.1.1",

        build_file = Label("//3rdparty/cargo/remote:winapi-build-0.1.1.BUILD"),
    )

    _new_http_archive(
        name = "raze__winapi_i686_pc_windows_gnu__0_4_0",
        url = "https://crates-io.s3-us-west-1.amazonaws.com/crates/winapi-i686-pc-windows-gnu/winapi-i686-pc-windows-gnu-0.4.0.crate",
        type = "tar.gz",
        strip_prefix = "winapi-i686-pc-windows-gnu-0.4.0",

        build_file = Label("//3rdparty/cargo/remote:winapi-i686-pc-windows-gnu-0.4.0.BUILD"),
    )

    _new_http_archive(
        name = "raze__winapi_util__0_1_3",
        url = "https://crates-io.s3-us-west-1.amazonaws.com/crates/winapi-util/winapi-util-0.1.3.crate",
        type = "tar.gz",
        strip_prefix = "winapi-util-0.1.3",

        build_file = Label("//3rdparty/cargo/remote:winapi-util-0.1.3.BUILD"),
    )

    _new_http_archive(
        name = "raze__winapi_x86_64_pc_windows_gnu__0_4_0",
        url = "https://crates-io.s3-us-west-1.amazonaws.com/crates/winapi-x86_64-pc-windows-gnu/winapi-x86_64-pc-windows-gnu-0.4.0.crate",
        type = "tar.gz",
        strip_prefix = "winapi-x86_64-pc-windows-gnu-0.4.0",

        build_file = Label("//3rdparty/cargo/remote:winapi-x86_64-pc-windows-gnu-0.4.0.BUILD"),
    )

    _new_http_archive(
        name = "raze__winreg__0_6_2",
        url = "https://crates-io.s3-us-west-1.amazonaws.com/crates/winreg/winreg-0.6.2.crate",
        type = "tar.gz",
        strip_prefix = "winreg-0.6.2",

        build_file = Label("//3rdparty/cargo/remote:winreg-0.6.2.BUILD"),
    )

    _new_http_archive(
        name = "raze__ws2_32_sys__0_2_1",
        url = "https://crates-io.s3-us-west-1.amazonaws.com/crates/ws2_32-sys/ws2_32-sys-0.2.1.crate",
        type = "tar.gz",
        strip_prefix = "ws2_32-sys-0.2.1",

        build_file = Label("//3rdparty/cargo/remote:ws2_32-sys-0.2.1.BUILD"),
    )

    _new_http_archive(
        name = "raze__xmlparser__0_9_0",
        url = "https://crates-io.s3-us-west-1.amazonaws.com/crates/xmlparser/xmlparser-0.9.0.crate",
        type = "tar.gz",
        strip_prefix = "xmlparser-0.9.0",

        build_file = Label("//3rdparty/cargo/remote:xmlparser-0.9.0.BUILD"),
    )

    _new_http_archive(
        name = "raze__yaml_rust__0_4_3",
        url = "https://crates-io.s3-us-west-1.amazonaws.com/crates/yaml-rust/yaml-rust-0.4.3.crate",
        type = "tar.gz",
        strip_prefix = "yaml-rust-0.4.3",

        build_file = Label("//3rdparty/cargo/remote:yaml-rust-0.4.3.BUILD"),
    )

