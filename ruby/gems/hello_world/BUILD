load("@bazelruby_ruby_rules//ruby:defs.bzl", "ruby_binary", "ruby_library", "ruby_test")

exports_files([
    "ruby/gems/hello_world/Gemfile",
    "ruby/gems/hello_world/Gemfile.lock",
    "ruby/gems/hello_world/hello_world.gemspec",
])

ruby_library(
    name = "lib",
    srcs = glob(["lib/**/*.rb"]),
    visibility = ["//visibility:public"],
)

ruby_binary(
    name = "cli",
    srcs = ["exe/hello-world"],
    main = "exe/hello-world",
    visibility = ["//visibility:public"],
    deps = [
        ":lib",
        "@bundle//:colored2",
    ],
)

ruby_test(
    name = "specs",
    size = "small",
    srcs = glob(["spec/**/*.rb"]),
    includes = ["ruby/gems/hello_world/lib"],
    main = "spec/spec_helper.rb",
    rubyopt = ["-rrspec/autorun"],
    deps = [
        ":lib",
        "@bundle//:colored2",
        "@bundle//:rspec",
    ],
)
