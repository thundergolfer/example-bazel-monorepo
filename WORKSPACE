workspace(name = "the_one_true_bazel_monorepo")

load("@bazel_tools//tools/build_defs/repo:http.bzl", "http_archive")
load("@bazel_tools//tools/build_defs/repo:git.bzl", "git_repository")

######################
# PYTHON SUPPORT
######################
rules_python_version = "115e3a0dab4291184fdcb0d4e564a0328364571a"

http_archive(
    name = "io_bazel_rules_python",
    url = "https://github.com/uri-canva/rules_python/archive/{}.tar.gz".format(rules_python_version),
)

######################
# SCALA SUPPORT
######################

# Note: commit before https://github.com/bazelbuild/rules_scala/issues/726 was introduced
rules_scala_version = "88ad68b3b9d2b533099cdd3d88a41d106edfeecb"

http_archive(
    name = "io_bazel_rules_scala",
    sha256 = "96b79ceec705bf6e81c4099bb9dcf0aec15747e658dc9406cb4bbf8b108ca38a",
    strip_prefix = "rules_scala-%s" % rules_scala_version,
    type = "zip",
    url = "https://github.com/bazelbuild/rules_scala/archive/%s.zip" % rules_scala_version,
)

load("@io_bazel_rules_scala//scala:scala.bzl", "scala_repositories")

scala_repositories()

load("@io_bazel_rules_scala//scala:toolchains.bzl", "scala_register_toolchains")

scala_register_toolchains()
