load("@linting_system//:rules.bzl", "linter")

package(default_visibility = ["//visibility:public"])

linter(
    name = "python",
    config = ":configuration/pyproject.toml",
    config_option = "--config",
    executable = "//tools/linting/python/formatter:main",
)

linter(
    name = "golang",
    config_str = "-w",
    executable_path = "/usr/local/bin/gofmt",
)
