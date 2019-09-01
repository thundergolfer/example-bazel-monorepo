workspace(name = "the_one_true_bazel_monorepo")

load("@bazel_tools//tools/build_defs/repo:http.bzl", "http_archive")
load("@bazel_tools//tools/build_defs/repo:git.bzl", "git_repository")

######################
# GOLANG SUPPORT
######################

load("@bazel_tools//tools/build_defs/repo:http.bzl", "http_archive")
http_archive(
    name = "io_bazel_rules_go",
    urls = ["https://github.com/bazelbuild/rules_go/releases/download/0.18.5/rules_go-0.18.5.tar.gz"],
    sha256 = "a82a352bffae6bee4e95f68a8d80a70e87f42c4741e6a448bec11998fcc82329",
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

# TODO(Jonathon): Find if it's possible to not have the function called 'maven_dependencies'
# Load dependencies managed by bazel-deps
load("//3rdparty:jvm_workspace.bzl", "maven_dependencies")

maven_dependencies()

######################
# DOCKER SUPPORT
######################

rules_docker_version = "0.9.0"

http_archive(
    name = "io_bazel_rules_docker",
    strip_prefix = "rules_docker-{version}".format(version = rules_docker_version),
    url = "https://github.com/bazelbuild/rules_docker/archive/v{version}.tar.gz".format(version = rules_docker_version),
)

load(
    "@io_bazel_rules_docker//repositories:repositories.bzl",
    container_repositories = "repositories",
)

container_repositories()

load(
    "@io_bazel_rules_docker//container:container.bzl",
    "container_pull",
)

container_pull(
    name = "awscli",
    registry = "docker.io",
    repository = "atlassian/pipelines-awscli",
    tag = "latest",
)

