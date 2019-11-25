load("@io_bazel_rules_jsonnet//jsonnet:jsonnet.bzl", "jsonnet_library", "jsonnet_to_json")

jsonnet_to_json(
    name = "test",
    src = "test.jsonnet",
    outs = [
        "test.json",
    ],
    ext_strs = {
        "test_ext_var": "{STABLE_BUILD_GIT_COMMIT}"
    },
    stamp_keys = ["test_ext_var"],
)
