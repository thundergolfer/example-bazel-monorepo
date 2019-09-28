workspace(name = "the_one_true_bazel_monorepo")

load("@bazel_tools//tools/build_defs/repo:http.bzl", "http_archive")
load("@bazel_tools//tools/build_defs/repo:git.bzl", "git_repository")

######################
# GOLANG SUPPORT
######################

http_archive(
    name = "io_bazel_rules_go",
    urls = [
        "https://storage.googleapis.com/bazel-mirror/github.com/bazelbuild/rules_go/releases/download/v0.19.5/rules_go-v0.19.5.tar.gz",
        "https://github.com/bazelbuild/rules_go/releases/download/v0.19.5/rules_go-v0.19.5.tar.gz",
    ],
    sha256 = "513c12397db1bc9aa46dd62f02dd94b49a9b5d17444d49b5a04c5a89f3053c1c",
)

load("@io_bazel_rules_go//go:deps.bzl", "go_rules_dependencies", "go_register_toolchains")

go_rules_dependencies()

go_register_toolchains()

# Gazelle - used for external dependencies
http_archive(
    name = "bazel_gazelle",
    urls = ["https://github.com/bazelbuild/bazel-gazelle/releases/download/0.17.0/bazel-gazelle-0.17.0.tar.gz"],
    sha256 = "3c681998538231a2d24d0c07ed5a7658cb72bfb5fd4bf9911157c0e9ac6a2687",
)

load("@bazel_gazelle//:deps.bzl", "gazelle_dependencies")
gazelle_dependencies()

load("//3rdparty:go_workspace.bzl", "go_dependencies")

go_dependencies()

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
        "com.google.guava:guava:27.1-jre",
        "junit:junit:4.12",
    ],
    repositories = [
        "https://maven.google.com",
        "https://repo1.maven.org/maven2",
    ],
    fetch_sources = True,   # Fetch source jars. Defaults to False.
)

######################
# PYTHON SUPPORT
######################
rules_python_version = "5bd834008f170c806ade1a135876d4a0b1ec3718"

http_archive(
    name = "io_bazel_rules_python",
    url = "https://github.com/uri-canva/rules_python/archive/{}.tar.gz".format(rules_python_version),
    strip_prefix = "rules_python-{version}".format(version = rules_python_version),
    sha256 = "f8ba6d729774eb71e32d8d78bc4a72c0fef7b9c190192caadd50ed7bd477ac99"
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
rules_scala_version = "7ffc700e32cc72d13be91dab366dd960c17a4c48"

http_archive(
    name = "io_bazel_rules_scala",
    sha256 = "abfa560cb089f95bf87b5f6b2b9e4b1fbfd80fd16a60bfd576cc392983cab2bb",
    strip_prefix = "rules_scala-%s" % rules_scala_version,
    type = "zip",
    url = "https://github.com/bazelbuild/rules_scala/archive/%s.zip" % rules_scala_version,
)

load("@io_bazel_rules_scala//scala:scala.bzl", "scala_repositories")

scala_repositories()

load("@io_bazel_rules_scala//scala:toolchains.bzl", "scala_register_toolchains")

scala_register_toolchains()

# Load dependencies managed by bazel-deps
load("//3rdparty:jvm_workspace.bzl", scala_deps = "maven_dependencies")

scala_deps()
