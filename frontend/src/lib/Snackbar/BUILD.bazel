load("@npm_bazel_typescript//:index.bzl", "ts_library")

package(default_visibility = ["//visibility:public"])

ts_library(
    name = "snackbar",
    srcs = [
        "Snackbar.tsx",
    ],
    tsconfig = "//frontend:tsconfig.json",
    deps = [
        "@npm//@types",  # this component does not dependent lodash but it needs the type definition, dont know why
        "@npm//react",
        "@npm//react-dom",
    ],
)
