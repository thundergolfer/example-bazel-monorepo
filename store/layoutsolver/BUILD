java_library(
    name = "layoutsolver",
    srcs = glob([
        "src/main/java/com/bookstore/layoutsolver/*.java",
    ]),
    deps = [
        "@maven//:com_google_guava_guava",
    ],
)

java_test(
    name = "test",
    timeout = "short",
    srcs = glob([
        "src/test/java/com/bookstore/layoutsolver/*.java",
    ]),
    test_class = "com.bookstore.layoutsolver.TestStoreLayoutSolver",
    deps = [
        ":layoutsolver",
        "@maven//:junit_junit",
    ],
)
