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

rules_scala_version="a89d44f7ef67d93dedfc9888630f48d7723516f7" # update this as needed

load("@bazel_tools//tools/build_defs/repo:http.bzl", "http_archive")
http_archive(
             name = "io_bazel_rules_scala",
             url = "https://github.com/bazelbuild/rules_scala/archive/%s.zip"%rules_scala_version,
             type = "zip",
             strip_prefix= "rules_scala-%s" % rules_scala_version
             )

load("@io_bazel_rules_scala//scala:scala.bzl", "scala_repositories")
scala_repositories()

load("@io_bazel_rules_scala//scala:toolchains.bzl", "scala_register_toolchains")
scala_register_toolchains()
