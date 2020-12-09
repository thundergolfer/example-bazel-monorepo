workspace(name = "example_bazel_monorepo")

load("@bazel_tools//tools/build_defs/repo:http.bzl", "http_archive")
load("@bazel_tools//tools/build_defs/repo:git.bzl", "git_repository")

######################
# GOLANG SUPPORT
######################

rules_go_version = "v0.22.6"

http_archive(
    name = "io_bazel_rules_go",
    sha256 = "e0d2e3d92ef8b3704f26ac19231ef9aba66c8a3bdec4aca91a22ad7d6e6f3ef7",
    urls = [
        "https://storage.googleapis.com/bazel-mirror/github.com/bazelbuild/rules_go/releases/download/{version}/rules_go-{version}.tar.gz".format(version = rules_go_version),
        "https://github.com/bazelbuild/rules_go/releases/download/{version}/rules_go-{version}.tar.gz".format(version = rules_go_version),
    ],
)

load("@io_bazel_rules_go//go:deps.bzl", "go_register_toolchains", "go_rules_dependencies")

go_rules_dependencies()

go_register_toolchains()

gazelle_version = "v0.21.1"

# Gazelle - used for Golang external dependencies
http_archive(
    name = "bazel_gazelle",
    sha256 = "cdb02a887a7187ea4d5a27452311a75ed8637379a1287d8eeb952138ea485f7d",
    urls = [
        "https://storage.googleapis.com/bazel-mirror/github.com/bazelbuild/bazel-gazelle/releases/download/{version}/bazel-gazelle-{version}.tar.gz".format(version = gazelle_version),
        "https://github.com/bazelbuild/bazel-gazelle/releases/download/{version}/bazel-gazelle-{version}.tar.gz".format(version = gazelle_version),
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

rules_jvm_external_version = "3.3"

http_archive(
    name = "rules_jvm_external",
    sha256 = "d85951a92c0908c80bd8551002d66cb23c3434409c814179c0ff026b53544dab",
    strip_prefix = "rules_jvm_external-{version}".format(version = rules_jvm_external_version),
    url = "https://github.com/bazelbuild/rules_jvm_external/archive/{version}.zip".format(version = rules_jvm_external_version),
)

load("@rules_jvm_external//:defs.bzl", "maven_install")

maven_install(
    name = "maven",
    artifacts = [
        "com.google.guava:guava:27.1-jre",
        "junit:junit:4.12",
        "org.hamcrest:hamcrest-library:1.3",
        "org.postgresql:postgresql:42.2.10",
        "org.springframework.boot:spring-boot-autoconfigure:2.1.3.RELEASE",
        "org.springframework.boot:spring-boot-loader:2.1.3.RELEASE",
        "org.springframework.boot:spring-boot-test-autoconfigure:2.1.3.RELEASE",
        "org.springframework.boot:spring-boot-test:2.1.3.RELEASE",
        "org.springframework.boot:spring-boot:2.1.3.RELEASE",
        "org.springframework.boot:spring-boot-starter-web:2.1.3.RELEASE",
        "org.springframework.boot:spring-boot-starter-data-jpa:2.1.3.RELEASE",
        "org.springframework:spring-beans:5.1.5.RELEASE",
        "org.springframework:spring-context:5.1.5.RELEASE",
        "org.springframework:spring-test:5.1.5.RELEASE",
        "org.springframework:spring-web:5.1.5.RELEASE",
        "org.springframework:spring-webmvc:5.1.5.RELEASE",
    ],
    fetch_sources = True,  # Fetch source jars. Defaults to False.
    maven_install_json = "@example_bazel_monorepo//3rdparty:maven_install.json",
    repositories = [
        "https://repo1.maven.org/maven2",
        "https://maven.google.com",
    ],
)

load("@maven//:defs.bzl", "pinned_maven_install")

pinned_maven_install()

######################
# PYTHON SUPPORT
######################
rules_python_version = "0.1.0"

http_archive(
    name = "rules_python",
    sha256 = "b6d46438523a3ec0f3cead544190ee13223a52f6a6765a29eae7b7cc24cc83a0",
    url = "https://github.com/bazelbuild/rules_python/releases/download/{version}/rules_python-{version}.tar.gz".format(version = rules_python_version),
)

load("@rules_python//python:repositories.bzl", "py_repositories")

py_repositories()

load("@rules_python//python:pip.bzl", "pip_install")

pip_install(
    name = "py_deps",
    requirements = "//tools/dependencies:python_requirements.txt",
)

# MYPY SUPPORT
mypy_integration_version = "0.1.0"  # latest @ November 15th 2020

http_archive(
    name = "mypy_integration",
    sha256 = "14d63ffa2a95e42ae468ad8785eec6c2cc489ce3b382cd0bdc7a4d115cf601b4",
    url = "https://github.com/thundergolfer/bazel-mypy-integration/releases/download/{version}/bazel_mypy_integration-{version}.tar.gz".format(
        version = mypy_integration_version,
    ),
)

load(
    "@mypy_integration//repositories:repositories.bzl",
    mypy_integration_repositories = "repositories",
)

mypy_integration_repositories()

load("@mypy_integration//:config.bzl", "mypy_configuration")

mypy_configuration("//tools/typing:mypy.ini")

load("@mypy_integration//repositories:deps.bzl", mypy_integration_deps = "deps")

mypy_integration_deps("//tools/typing:mypy_version.txt")

######################
# RUST SUPPORT
######################

rules_rust_version = "fe50d3b54aecbaeac48abdc2ca7cd00a94969e15"

http_archive(
    name = "io_bazel_rules_rust",
    sha256 = "3f6db529492d821a91560c230e2634e34b3e0a3147fc5c4c41ac5bc6ccd45d3f",
    strip_prefix = "rules_rust-{version}".format(version = rules_rust_version),
    urls = [
        # Master branch as of 2019-10-07
        "https://github.com/bazelbuild/rules_rust/archive/{version}.tar.gz".format(version = rules_rust_version),
    ],
)

load("@io_bazel_rules_rust//rust:repositories.bzl", "rust_repositories")

rust_repositories()

load("@io_bazel_rules_rust//:workspace.bzl", "bazel_version")

bazel_version(name = "bazel_version")

load("//3rdparty/cargo:crates.bzl", "raze_fetch_remote_crates")

raze_fetch_remote_crates()

######################
# SCALA SUPPORT
######################

rules_scala_version = "0c1ed832f2db5fa1069c7b21d546f234d078d210"

http_archive(
    name = "io_bazel_rules_scala",
    sha256 = "5be1fde5e5435da1485a8ff724e0588b7b2462c8315e406666ad00b7d769d152",
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
load("//3rdparty:target_file.bzl", "build_external_workspace")

build_external_workspace(name = "3rdparty_jvm")

scala_deps()

#######################################
# TYPESCRIPT / NODEJS SUPPORT
#######################################

rules_nodejs_version = "1.7.0"

load("@bazel_tools//tools/build_defs/repo:http.bzl", "http_archive")

http_archive(
    name = "build_bazel_rules_nodejs",
    sha256 = "84abf7ac4234a70924628baa9a73a5a5cbad944c4358cf9abdb4aab29c9a5b77",
    urls = [
        "https://github.com/bazelbuild/rules_nodejs/releases/download/{version}/rules_nodejs-{version}.tar.gz".format(
            version = rules_nodejs_version,
        ),
    ],
)

load("@build_bazel_rules_nodejs//:index.bzl", "yarn_install")

yarn_install(
    name = "npm",
    package_json = "//3rdparty/typescript:package.json",
    yarn_lock = "//3rdparty/typescript:yarn.lock",
)

load("@npm//:install_bazel_dependencies.bzl", "install_bazel_dependencies")

install_bazel_dependencies()

# Set up TypeScript toolchain
load("@npm_bazel_typescript//:index.bzl", "ts_setup_workspace")

ts_setup_workspace()

######################
# CODE DISTRIBUTION
######################

#graknlabs_bazel_distribution_version = "af5283473c9c7dca59579532d0d233f3f6a47e5f"
#
#http_archive(
#    name = "graknlabs_bazel_distribution",
#    sha256 = "cbda10301d41d7b601b55d86d62576f30eea9af22e8f453178f424be28262fdc",
#    strip_prefix = "bazel-distribution-{version}".format(version = graknlabs_bazel_distribution_version),
#    urls = ["https://github.com/graknlabs/bazel-distribution/archive/{version}.zip".format(version = graknlabs_bazel_distribution_version)],
#)
#
#load("@rules_python//python:pip.bzl", "pip_import", "pip_repositories")
#
#pip_repositories()
#
#pip_import(
#    name = "graknlabs_bazel_distribution_pip",
#    requirements = "@graknlabs_bazel_distribution//tools/python/distribution/pip/:requirements.txt",
#)
#
#load("@graknlabs_bazel_distribution_pip//:requirements.bzl", graknlabs_bazel_distribution_pip_install = "pip_install")
#
#graknlabs_bazel_distribution_pip_install()

######################
# OTHER
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

linting_system_version = "0.4.1"

# Source code linting system
# ⚠️ Currently in ALPHA as at 2020/06/10
http_archive(
    name = "linting_system",
    sha256 = "fa62cecb008e6f319a81f4f619c0d632ad7e3087c7d0c331028eb91c027d49e5",
    strip_prefix = "bazel-linting-system-{version}".format(version = linting_system_version),
    url = "https://github.com/thundergolfer/bazel-linting-system/archive/v{version}.zip".format(version = linting_system_version),
)

load("@linting_system//repositories:repositories.bzl", "repositories")

repositories()

load("@linting_system//repositories:go_repositories.bzl", "go_deps")

go_deps()
