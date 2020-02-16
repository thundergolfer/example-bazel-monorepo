java_library(
    name = "services",
    srcs = glob(["*.java"]),
    visibility = [
        "//store-api:__subpackages__",
    ],
    deps = [
        "//store-api/src/main/java/com/book/store/api/models",
        "//store-api/src/main/java/com/book/store/api/repositories",
        "@maven//:org_springframework_boot_spring_boot_starter_data_jpa",
        "@maven//:org_springframework_data_spring_data_jpa",
        "@maven//:org_springframework_spring_beans",
        "@maven//:org_springframework_spring_context",
    ],
)
