def py_interpreter(name, deps, visibility = None):
    native.py_binary(
        name = name,
        srcs = ["//tools/python/interpreter:interpreter.py"],
        main = "//tools/python/interpreter:interpreter.py",
        deps = [
            "//tools/python/interpreter",
        ] + deps,
    )
