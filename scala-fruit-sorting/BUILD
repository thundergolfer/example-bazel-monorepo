SRCS = glob(["src/main/scala/com/fruit/sorting/*.scala"])

scala_binary(
    name = "scala-fruit-sorting",
    srcs = SRCS,
    main_class = "Sorter",
    deps = [],
)

TEST_SRCS = glob(["src/test/scala/com/fruit/sorting/*.scala"])

TEST_DEPS = [
    "//3rdparty/jvm/org/scalatest:scalatest",
]

scala_test(
    name = "test",
    srcs = TEST_SRCS,
    deps = [],
)
