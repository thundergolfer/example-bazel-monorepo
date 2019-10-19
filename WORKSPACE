workspace(name = "the_one_true_bazel_monorepo")

load("@bazel_tools//tools/build_defs/repo:http.bzl", "http_archive")
load("@bazel_tools//tools/build_defs/repo:git.bzl", "git_repository")

######################
# DOCKER SUPPORT
######################
rules_docker_version = "0.12.0"

http_archive(
    name = "io_bazel_rules_docker",
    sha256 = "413bb1ec0895a8d3249a01edf24b82fd06af3c8633c9fb833a0cb1d4b234d46d",
    strip_prefix = "rules_docker-{version}".format(version = rules_docker_version),
    urls = [
        "https://github.com/bazelbuild/rules_docker/archive/v{version}.tar.gz".format(version = rules_docker_version)
    ],
)

# Instantiate the "repositories" Bazel rule in rules_docker as "container_repositories"
load(
    "@io_bazel_rules_docker//repositories:repositories.bzl",
    container_repositories = "repositories",
)

container_repositories()

load(
    "@io_bazel_rules_docker//java:image.bzl",
    _java_image_repos = "repositories",
)

_java_image_repos()

######################
# GOLANG SUPPORT
######################

http_archive(
    name = "io_bazel_rules_go",
    sha256 = "513c12397db1bc9aa46dd62f02dd94b49a9b5d17444d49b5a04c5a89f3053c1c",
    urls = [
        "https://storage.googleapis.com/bazel-mirror/github.com/bazelbuild/rules_go/releases/download/v0.19.5/rules_go-v0.19.5.tar.gz",
        "https://github.com/bazelbuild/rules_go/releases/download/v0.19.5/rules_go-v0.19.5.tar.gz",
    ],
)

load("@io_bazel_rules_go//go:deps.bzl", "go_register_toolchains", "go_rules_dependencies")

go_rules_dependencies()

go_register_toolchains()

# Gazelle - used for Golang external dependencies
http_archive(
    name = "bazel_gazelle",
    sha256 = "7fc87f4170011201b1690326e8c16c5d802836e3a0d617d8f75c3af2b23180c4",
    urls = [
        "https://storage.googleapis.com/bazel-mirror/github.com/bazelbuild/bazel-gazelle/releases/download/0.18.2/bazel-gazelle-0.18.2.tar.gz",
        "https://github.com/bazelbuild/bazel-gazelle/releases/download/0.18.2/bazel-gazelle-0.18.2.tar.gz",
    ],
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
    sha256 = "79c9850690d7614ecdb72d68394f994fef7534b292c4867ce5e7dec0aa7bdfad",
    strip_prefix = "rules_jvm_external-2.8",
    url = "https://github.com/bazelbuild/rules_jvm_external/archive/2.8.zip",
)

load("@rules_jvm_external//:defs.bzl", "maven_install")

maven_install(
    name = "maven",
    artifacts = [
        "com.google.guava:guava:27.1-jre",
        "junit:junit:4.12",
        "org.springframework:spring-webmvc:5.1.10.RELEASE",
        "org.springframework:spring-context:5.1.10.RELEASE",
        "org.springframework:spring-web:5.1.10.RELEASE",
        "org.springframework.boot:spring-boot:2.1.9.RELEASE",
        "org.springframework.boot:spring-boot-autoconfigure:2.1.9.RELEASE",
        "org.springframework.boot:spring-boot-starter-test:2.1.9.RELEASE",
        "org.springframework.boot:spring-boot-starter-web:2.1.9.RELEASE",
    ],
    fetch_sources = True,  # Fetch source jars. Defaults to False.
    repositories = [
        "https://maven.google.com",
        "https://repo1.maven.org/maven2",
    ],
    strict_visibility = True
)

######################
# PYTHON SUPPORT
######################
rules_python_version = "5bd834008f170c806ade1a135876d4a0b1ec3718"

http_archive(
    name = "io_bazel_rules_python",
    sha256 = "f8ba6d729774eb71e32d8d78bc4a72c0fef7b9c190192caadd50ed7bd477ac99",
    strip_prefix = "rules_python-{version}".format(version = rules_python_version),
    url = "https://github.com/uri-canva/rules_python/archive/{}.tar.gz".format(rules_python_version),
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
rules_scala_version = "f985e5e0d6364970be8d6f15d262c8b0e0973d1b"

http_archive(
    name = "io_bazel_rules_scala",
    sha256 = "2b5d595e04cc7f65e5de6d4efe022b3c52bf7aec42ff559011eb70cd1b300ba8",
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

######################
# INFRASTRUCTURE
######################

rules_k8s_version = "0.2"
# This requires rules_docker to be fully instantiated before
# it is pulled in.
http_archive(
    name = "io_bazel_rules_k8s",
    sha256 = "649a851538f863410fd78147b78334bc7f47008d77712a4ee2f76d6aade704e7",
    strip_prefix = "rules_k8s-{version}".format(version = rules_k8s_version),
    urls = [
        "https://github.com/bazelbuild/rules_k8s/releases/download/v{version}/rules_k8s-v{version}.tar.gz".format(version = rules_k8s_version)
    ],
)

load("@io_bazel_rules_k8s//k8s:k8s.bzl", "k8s_repositories")

k8s_repositories()

load("@io_bazel_rules_k8s//k8s:k8s_go_deps.bzl", k8s_go_deps = "deps")

k8s_go_deps()

load("@io_bazel_rules_k8s//k8s:k8s.bzl", "k8s_defaults")

# Set up some default attributes when the K8s rule "k8s_object" is called later
# This only applies to "k8s_object" called with kind = "deployment"
# This also exposes a Bazel rule called "k8s_deploy"
# which we use in java-spring-boot/BUILD.bazel and js-client/BUILD.bazel.
# See https://github.com/bazelbuild/rules_k8s#k8s_defaults
k8s_defaults(
    name = "k8s_deploy",
    kind = "deployment",
    namespace = "default"
)

# Set up some default attributes when the K8s rule "k8s_object" is called later
# This only applies to "k8s_object" called with kind = "service"
# See https://github.com/bazelbuild/rules_k8s#k8s_defaults
k8s_defaults(
    name = "k8s_service",
    kind = "service",
    namespace = "default"
)

######################
# *OTHER*
######################

# requirement of 'com_github_bazelbuild_buildtools'
http_archive(
    name = "com_google_protobuf",
    strip_prefix = "protobuf-master",
    urls = ["https://github.com/protocolbuffers/protobuf/archive/master.zip"],
)

load("@com_google_protobuf//:protobuf_deps.bzl", "protobuf_deps")

protobuf_deps()

# buildifier BUILD file linter
http_archive(
    name = "com_github_bazelbuild_buildtools",
    strip_prefix = "buildtools-master",
    url = "https://github.com/bazelbuild/buildtools/archive/master.zip",
)
