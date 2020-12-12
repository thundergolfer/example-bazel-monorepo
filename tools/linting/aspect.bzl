load("@linting_system//:generator.bzl", "linting_aspect_generator")

lint = linting_aspect_generator(
    name = "lint",
    linters = [
        "@//tools/linting:python",
        # TODO(Jonathon): Register the golang linter as well.
    ],
)
