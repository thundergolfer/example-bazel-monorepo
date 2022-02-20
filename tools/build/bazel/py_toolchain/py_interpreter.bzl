OSX_OS_NAME = "mac os x"
LINUX_OS_NAME = "linux"

def _python_build_standalone_interpreter_impl(repository_ctx):
    os_name = repository_ctx.os.name.lower()

    # TODO(Jonathon): This can't differentiate ARM (Mac M1) from old x86.
    # TODO(Jonathon: Support Windows.
    if os_name == OSX_OS_NAME:
        url = "https://github.com/indygreg/python-build-standalone/releases/download/20211017/cpython-3.10.0-x86_64-apple-darwin-install_only-20211017T1616.tar.gz"
        integrity_shasum = "fc0d184feb6db61f410871d0660d2d560e0397c36d08b086dfe115264d1963f4"
    elif os_name == "linux":
        url = "https://github.com/indygreg/python-build-standalone/releases/download/20211017/cpython-3.10.0-x86_64-unknown-linux-gnu-install_only-20211017T1616.tar.gz"
        integrity_shasum = "eada875c9b39cc4bf4a055dd8f5188e99c0c90dd5deb05b6c213f49482fe20a6"
    else:
        fail("OS '{}' is not supported.".format(os_name))

    repository_ctx.download_and_extract(
        url = [url],
        sha256 = integrity_shasum,
        output = "",
    )
    BUILD_FILE_CONTENT = """
filegroup(
    name = "files",
    srcs = glob(["**"], allow_empty=False),
    visibility = ["//visibility:public"],
)

filegroup(
    name = "interpreter",
    srcs = ["python/bin/python3"],
    visibility = ["//visibility:public"],
)
"""
    repository_ctx.file("BUILD.bazel", BUILD_FILE_CONTENT)
    return None

python_build_standalone_interpreter = repository_rule(
    implementation = _python_build_standalone_interpreter_impl,
    attrs = {},
)
