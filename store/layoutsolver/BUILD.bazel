
java_library(
    name = "layoutsolver",
    srcs = glob([
        "src/main/java/com/fruitstore/layoutsolver/*.java"
    ]),
    deps = [
        "@maven//:com_google_guava_guava",
    ]
)

java_test(
    name = "test",
    test_class = "com.fruitstore.layoutsolver.TestStoreLayoutSolver",
    srcs = glob([
        "src/test/java/com/fruitstore/layoutsolver/*.java"
    ]),
    deps = [
        ":layoutsolver",
        "@maven//:junit_junit",
    ]
)