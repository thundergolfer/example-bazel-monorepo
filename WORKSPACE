workspace(name = "example_bazel_monorepo")

load("@bazel_tools//tools/build_defs/repo:http.bzl", "http_archive")
load("@bazel_tools//tools/build_defs/repo:git.bzl", "git_repository")

######################
# GOLANG SUPPORT
######################

rules_go_version = "v0.24.9"  # latest @ 2020/12/12

http_archive(
    name = "io_bazel_rules_go",
    sha256 = "81eff5df9077783b18e93d0c7ff990d8ad7a3b8b3ca5b785e1c483aacdb342d7",
    urls = [
        "https://mirror.bazel.build/github.com/bazelbuild/rules_go/releases/download/{version}/rules_go-{version}.tar.gz".format(version = rules_go_version),
        "https://github.com/bazelbuild/rules_go/releases/download/{version}/rules_go-{version}.tar.gz".format(version = rules_go_version),
    ],
)

load("@io_bazel_rules_go//go:deps.bzl", "go_register_toolchains", "go_rules_dependencies")

go_rules_dependencies()

go_register_toolchains()

gazelle_version = "v0.22.2"  # latest @ 2020/12/12

# Gazelle - used for Golang external dependencies
http_archive(
    name = "bazel_gazelle",
    sha256 = "b85f48fa105c4403326e9525ad2b2cc437babaa6e15a3fc0b1dbab0ab064bc7c",
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
rules_python_version = "0.0.2"

http_archive(
    name = "rules_python",
    sha256 = "b5668cde8bb6e3515057ef465a35ad712214962f0b3a314e551204266c7be90c",
    strip_prefix = "rules_python-{version}".format(version = rules_python_version),
    url = "https://github.com/bazelbuild/rules_python/releases/download/{version}/rules_python-{version}.tar.gz".format(version = rules_python_version),
)

load("@rules_python//python:repositories.bzl", "py_repositories")

py_repositories()

# Third-Party packaging support
rules_python_external_version = "0.1.5"

http_archive(
    name = "rules_python_external",
    sha256 = "bc655e6d402915944e014c3b2cad23d0a97b83a66cc22f20db09c9f8da2e2789",
    strip_prefix = "rules_python_external-{version}".format(version = rules_python_external_version),
    url = "https://github.com/dillon-giacoppo/rules_python_external/archive/v{version}.zip".format(version = rules_python_external_version),
)

# Install the rule dependencies
load("@rules_python_external//:repositories.bzl", "rules_python_external_dependencies")

rules_python_external_dependencies()

load("@rules_python_external//:defs.bzl", "pip_install")

pip_install(
    name = "py_deps",
    requirements = "//tools/dependencies:python_requirements.txt",
)

# MYPY SUPPORT
mypy_integration_version = "0.0.7"

http_archive(
    name = "mypy_integration",
    sha256 = "32b0d56827288931ed3b93f047f18bd417a98fbf25fb34f6a8d9ed8d35cdaa55",
    strip_prefix = "bazel-mypy-integration-{version}".format(version = mypy_integration_version),
    url = "https://github.com/thundergolfer/bazel-mypy-integration/archive/{version}.tar.gz".format(
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

load("@mypy_integration//repositories:pip_repositories.bzl", mypy_integration_pip_deps = "pip_deps")

mypy_integration_pip_deps()

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

rules_nodejs_version = "2.3.1"  # latest @ 2020/12/12

http_archive(
    name = "build_bazel_rules_nodejs",
    sha256 = "121f17d8b421ce72f3376431c3461cd66bfe14de49059edc7bb008d5aebd16be",
    urls = [
        "https://github.com/bazelbuild/rules_nodejs/releases/download/{version}/rules_nodejs-{version}.tar.gz".format(version = rules_nodejs_version)
    ],
)

load("@build_bazel_rules_nodejs//:index.bzl", "node_repositories")

node_repositories(package_json = ["//3rdparty/typescript:package.json"])

load("@build_bazel_rules_nodejs//:index.bzl", "yarn_install")

yarn_install(
    name = "npm",
    package_json = "//3rdparty/typescript:package.json",
    yarn_lock = "//3rdparty/typescript:yarn.lock",
)

# Set up TypeScript toolchain
load("@npm_bazel_typescript//:index.bzl", "ts_setup_workspace")

ts_setup_workspace()

######################
# CODE DISTRIBUTION
######################

graknlabs_bazel_distribution_version = "af5283473c9c7dca59579532d0d233f3f6a47e5f"

http_archive(
    name = "graknlabs_bazel_distribution",
    sha256 = "cbda10301d41d7b601b55d86d62576f30eea9af22e8f453178f424be28262fdc",
    strip_prefix = "bazel-distribution-{version}".format(version = graknlabs_bazel_distribution_version),
    urls = ["https://github.com/graknlabs/bazel-distribution/archive/{version}.zip".format(version = graknlabs_bazel_distribution_version)],
)

load("@rules_python//python:pip.bzl", "pip_import", "pip_repositories")

pip_repositories()

pip_import(
    name = "graknlabs_bazel_distribution_pip",
    requirements = "@graknlabs_bazel_distribution//pip:requirements.txt",
)

load("@graknlabs_bazel_distribution_pip//:requirements.bzl", graknlabs_bazel_distribution_pip_install = "pip_install")

graknlabs_bazel_distribution_pip_install()

######################
# OTHER
######################

protobuf_version = "3.14.0"

protobuf_version_sha256 = "d0f5f605d0d656007ce6c8b5a82df3037e1d8fe8b121ed42e536f569dec16113"

# requirement of 'com_github_bazelbuild_buildtools'
http_archive(
    name = "com_google_protobuf",
    sha256 = protobuf_version_sha256,
    strip_prefix = "protobuf-%s" % protobuf_version,
    url = "https://github.com/protocolbuffers/protobuf/archive/v%s.tar.gz" % protobuf_version,
)

load("@com_google_protobuf//:protobuf_deps.bzl", "protobuf_deps")

protobuf_deps()

# buildifier BUILD file linter
http_archive(
    name = "com_github_bazelbuild_buildtools",
    strip_prefix = "buildtools-master",
    url = "https://github.com/bazelbuild/buildtools/archive/master.zip",
)

linting_system_version = "7f8b336f4e9dbfcfd4fe6a1406047e72abc059aa"

# Source code linting system
# ⚠️ Currently in ALPHA as at 2020/12/12
http_archive(
    name = "linting_system",
    sha256 = "fc9b5c78aff9836b5c7abe6ed24f9ad549fbec642bb43e27584fcf416991f786",
    strip_prefix = "bazel-linting-system-{version}".format(version = linting_system_version),
    url = "https://github.com/thundergolfer/bazel-linting-system/archive/{version}.zip".format(version = linting_system_version),
)

load("@linting_system//repositories:repositories.bzl", "repositories")

repositories()

load("@linting_system//repositories:go_repositories.bzl", "go_deps")

go_deps()
