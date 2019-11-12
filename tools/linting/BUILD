load("@linting_system//:rules.bzl", "linter")

package(default_visibility = ['//visibility:public'])

linter(
    name = "python",
    executable_path = "/usr/local/bin/black",
    config = ":configuration/pyproject.toml",
    config_option = "--config",
)

linter(
    name = "golang",
    executable_path = "/usr/local/bin/gofmt",
    config_str = "-w",
)