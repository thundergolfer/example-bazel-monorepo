load("@bazel_gazelle//:deps.bzl", "go_repository")

def go_dependencies():
    go_repository(
        name = "com_github_pkg_errors",
        importpath = "github.com/pkg/errors",  # Import path used in the .go files
        tag = "v0.8.1",  # Specific tag, commits are also supported
    )

    go_repository(
        name = "com_github_urfave_cli",
        importpath = "github.com/urfave/cli",
        tag = "v1.20.0",
    )
