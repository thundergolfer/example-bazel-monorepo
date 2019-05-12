load("@io_bazel_rules_scala//scala:scala_import.bzl", "scala_import")
scala_import(
    name = "scalatest",
    exports = [
        "//3rdparty/jvm/org/scala_lang/modules:scala_xml_2_11",
        "//3rdparty/jvm/org/scala_lang:scala_library",
        "//3rdparty/jvm/org/scala_lang:scala_reflect",
        "//3rdparty/jvm/org/scalactic:scalactic"
    ],
    jars = [
        "//external:jar/org/scalatest/scalatest_2_11"
    ],
    visibility = [
        "//visibility:public"
    ]
)


