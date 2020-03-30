SRCS = glob(["src/main/scala/com/book/sorting/*.scala"])

scala_binary(
    name = "scala-book-sorting",
    srcs = SRCS,
    main_class = "com.book.sorting.Sorter",
    deps = [],
)

TEST_DEPS = [
    "@3rdparty_jvm//org/scalatest:scalatest",
]

scala_test(
    name = "test",
    timeout = "short",
    srcs = glob(["src/test/scala/com/book/sorting/*.scala"]),
    deps = TEST_DEPS,
)
