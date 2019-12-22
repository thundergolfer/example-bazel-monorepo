package(default_visibility = ["//visibility:public"])

exports_files([
    "ruby/apps/hello-world-web/Gemfile",
    "ruby/apps/hello-world-web/Gemfile.lock",
])

load("@bazelruby_ruby_rules//ruby:defs.bzl", "ruby_binary")

# Ruby Web Server that depends on the hello_world gem
ruby_binary(
    name = "server",
    srcs = [
        "app/main.rb",
        "bin/shotgun",
        "config.ru",
    ],
    main = "bin/shotgun",
    deps = [
        "//ruby/gems/hello_world:lib",
        "@bundle//:awesome_print",
        "@bundle//:colored2",
        "@bundle//:puma",
        "@bundle//:rake",
        "@bundle//:shotgun",
        "@bundle//:sinatra",
    ],
)

# sh_binary(
#     name = "hello-world-server",
#     srcs = ["start"],
# )
