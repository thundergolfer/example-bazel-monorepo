SRCS = glob(["src/main/scala/com/book/sorting/*.scala"])

scala_binary(
    name = "scala-book-sorting",
    srcs = SRCS,
    main_class = "Sorter",
    deps = [],
)

TEST_SRCS = glob(["src/test/scala/com/book/sorting/*.scala"])

TEST_DEPS = [
    "//3rdparty/jvm/org/scalatest:scalatest",
]

scala_test(
    name = "test",
    srcs = TEST_SRCS,
    deps = [],
)
