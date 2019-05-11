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
    strip_prefix = "rules_python-{version}".format(version = rules_python_version),
    sha256 = "0d1810fecc1bf2b6979d2af60e157d93d3004805bd8b7fda6eb52dda13480dca"
)

load("@io_bazel_rules_python//python:pip.bzl", "pip_import", "pip_repositories")

pip_repositories()

pip_import(
   name = "pip_dependencies",
   requirements = "//tools/dependencies:python_requirements.txt",
)

# Load the pip_install symbol for my_deps, and create the dependencies repositories.
load("@pip_dependencies//:requirements.bzl", "pip_install")
pip_install()


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

#######################
# JAVA SUPPORT
#######################

load("@bazel_tools//tools/build_defs/repo:http.bzl", "http_archive")

http_archive(
    name = "rules_jvm_external",
    strip_prefix = "rules_jvm_external-1.2",
    sha256 = "e5c68b87f750309a79f59c2b69ead5c3221ffa54ff9496306937bfa1c9c8c86b",
    url = "https://github.com/bazelbuild/rules_jvm_external/archive/1.2.zip"
)

load("@rules_jvm_external//:defs.bzl", "maven_install")

maven_install(
    name = "maven",
    artifacts = [
        "com.google.guava:guava:27.1",
    ],
    repositories = [
        "https://maven.google.com",
        "https://repo1.maven.org/maven2",
    ],
    fetch_sources = True,   # Fetch source jars. Defaults to False.
)
