load("@io_bazel_rules_go//go:def.bzl", "go_binary", "go_library", "go_test")

go_binary(
    name = "cli",
    srcs = glob([
        "*.go",
    ]),
    importpath = "github.com/thundergoler/the-one-true-bazel-monorepo/cli",
    visibility = ["//visibility:public"],
    deps = [
        "@com_github_urfave_cli//:go_default_library",
    ],
)
