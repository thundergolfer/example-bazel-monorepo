load("//tools/springboot:springboot.bzl", "springboot")

#springboot_deps = [
#  "//tools/springboot/import_bundles:springboot_required_deps",
#  "//tools/springboot/import_bundles:springboot_jetty_starter_deps",
#  "//tools/springboot/import_bundles:springboot_web_starter_deps",
#]

DEPS = [
   "@maven//:org_springframework_boot_spring_boot",
   "@maven//:org_springframework_boot_spring_boot_loader",
   "@maven//:org_springframework_boot_spring_boot_autoconfigure",
   "@maven//:org_springframework_boot_spring_boot_starter_web",
   "@maven//:org_springframework_spring_context",
   "@maven//:org_springframework_spring_web",
]

java_library(
    name = "lib",
    srcs = glob(["*.java"]),
    visibility = ["//src/test:__subpackages__"],
    deps = DEPS,
)

java_binary(
    name = "app",
    main_class = "com.book.store.api.Application",
    runtime_deps = [
        ":lib",
    ],
)

# use the springboot rule to build the app as a Spring Boot executable jar
springboot(
    name = "deployable",
    boot_app_class = "com.book.store.api.Application",
    java_library = ":lib",
#    deps = springboot_deps,
    deps = DEPS,
)