workspace(name = "example_bazel_monorepo")

load("@bazel_tools//tools/build_defs/repo:http.bzl", "http_archive")
load("@bazel_tools//tools/build_defs/repo:git.bzl", "git_repository")

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

rules_jvm_external_version = "2.10"

http_archive(
    name = "rules_jvm_external",
    sha256 = "1bbf2e48d07686707dd85357e9a94da775e1dbd7c464272b3664283c9c716d26",
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
    ],
    fetch_sources = True,  # Fetch source jars. Defaults to False.
    repositories = [
        "https://maven.google.com",
        "https://repo1.maven.org/maven2",
    ],
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

# Third-Party packaging support
rules_python_external_version = "12bfbdffc57bbaf9a3de31e6a7acdc415eb9de72"

http_archive(
    name = "rules_python_external",
    sha256 = "31c1199d66241114c6974eafcb5578924a106f3fc62bcfcda6930159279098e0",
    strip_prefix = "rules_python_external-{version}".format(version = rules_python_external_version),
    url = "https://github.com/dillon-giacoppo/rules_python_external/archive/{version}.zip".format(version = rules_python_external_version),
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
# RUBY SUPPORT
######################
rules_ruby_version = "a0d21e570f79424e6125df6c691ab27ed7454e1a"

# TODO(Jonathon): Reinstate this when it isn't breaking CI
# Ref: https://buildkite.com/thundergolfer-inc/the-one-true-bazel-monorepo/builds/162#7a972413-1ff2-43a9-8385-a1a871acf358
#http_archive(
#    name = "bazelruby_ruby_rules",
#    sha256 = "",
#    strip_prefix = "rules_ruby-{version}".format(version = rules_ruby_version),
#    url = "https://github.com/bazelruby/rules_ruby/archive/{version}.zip".format(version = rules_ruby_version),
#)
#
#load(
#    "@bazelruby_ruby_rules//ruby:deps.bzl",
#    "ruby_register_toolchains",
#    "ruby_rules_dependencies",
#)
#
#ruby_rules_dependencies()
#
#ruby_register_toolchains()
#
#load("@bazelruby_ruby_rules//ruby:defs.bzl", "bundle_install")
#
#bundle_install(
#    name = "bundle",
#    gemfile = "//tools/dependencies:Gemfile",
#    gemfile_lock = "//tools/dependencies:Gemfile.lock",
#    visibility = ["//visibility:public"],
#)

######################
# SCALA SUPPORT
######################

rules_scala_version = "e83df505ad87a2a5bdadd6b1230a1db579791b09"

http_archive(
    name = "io_bazel_rules_scala",
    sha256 = "6a69c9a9f6928920755ac634046f32f851c290e43e7ebf199e651970e823e8a1",
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

#######################################
# TYPESCRIPT / NODE-JS
#######################################

rules_nodejs_version = "1.0.1"

load("@bazel_tools//tools/build_defs/repo:http.bzl", "http_archive")

http_archive(
    name = "build_bazel_rules_nodejs",
    sha256 = "e1a0d6eb40ec89f61a13a028e7113aa3630247253bcb1406281b627e44395145",
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

linting_system_version = "0.3.0"

# source code linting system
# ⚠️ Currently in ALPHA as at 2020/03/10
http_archive(
    name = "linting_system",
    sha256 = "1175101c17edba1d37ada53c7737ac4991292daa908d0898916f807972e13df4",
    strip_prefix = "bazel-linting-system-{version}".format(version = linting_system_version),
    url = "https://github.com/thundergolfer/bazel-linting-system/archive/v{version}.zip".format(version = linting_system_version),
)

load("@linting_system//repositories:repositories.bzl", "repositories")

repositories()

load("@linting_system//repositories:go_repositories.bzl", "go_deps")

go_deps()
