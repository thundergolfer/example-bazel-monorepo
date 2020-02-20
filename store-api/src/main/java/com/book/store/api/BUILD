load("//tools/springboot:springboot.bzl", "springboot")

DEPS = [
    "@maven//:org_springframework_boot_spring_boot",
    "@maven//:org_springframework_boot_spring_boot_loader",
    "@maven//:org_springframework_boot_spring_boot_autoconfigure",
    "@maven//:org_springframework_boot_spring_boot_starter_web",
    "@maven//:org_springframework_data_spring_data_jpa",
    "@maven//:org_springframework_spring_beans",
    "@maven//:org_springframework_spring_context",
    "@maven//:org_springframework_spring_web",
    "@maven//:org_postgresql_postgresql",
    "//store-api/src/main/java/com/book/store/api/models",
    "//store-api/src/main/java/com/book/store/api/repositories",
    "//store-api/src/main/java/com/book/store/api/services",
]

java_library(
    name = "lib",
    srcs = glob(["*.java"]),
    resources = [
        "//store-api/src/main/resources:properties",
    ],
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
    deps = DEPS,
    #    fail_on_duplicate_classes=True
)
