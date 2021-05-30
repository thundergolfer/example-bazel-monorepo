load("@rules_python//python/pip_install:requirements.bzl", "compile_pip_requirements")

# Update dependencies with:
# bazel run //3rdparty:requirements.update
compile_pip_requirements(
    name = "requirements",
    extra_args = [
        "--allow-unsafe",
    ],
)
