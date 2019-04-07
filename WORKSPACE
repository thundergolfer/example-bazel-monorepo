workspace(name = "the_one_true_bazel_monorepo")

load("@bazel_tools//tools/build_defs/repo:http.bzl", "http_archive")
load("@bazel_tools//tools/build_defs/repo:git.bzl", "git_repository")


######################
# PYTHON SUPPORT
######################
rules_python_version = "115e3a0dab4291184fdcb0d4e564a0328364571a"
http_archive(
    name = "io_bazel_rules_python",
    url = "https://github.com/uri-canva/rules_python/archive/{}.tar.gz".format(rules_python_version)
)

######################
# SCALA SUPPORT
######################
