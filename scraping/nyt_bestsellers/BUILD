load("@py_deps//:requirements.bzl", "requirement")
load("//tools/python/interpreter:macro.bzl", "py_interpreter")

DEPS = [
    requirement("requests"),
    requirement("beautifulsoup4"),
]

py_binary(
    name = "nyt_bestsellers",
    srcs = ["main.py"],
    main = "main.py",
    deps = DEPS,
)

# Try it with:
# $ bazel run //scraping/nyt_bestsellers:repl
# >>> from scraping.nyt_bestsellers.main import run
# >>> run()
py_interpreter(
    name = "repl",
    deps = [":nyt_bestsellers"],
)
