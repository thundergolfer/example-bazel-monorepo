# AUTO GENERATED. DO NOT EDIT DIRECTLY.
#
# Generated with https://github.com/tubular/rules_pygen
#
load("@bazel_tools//tools/build_defs/repo:http.bzl", "http_archive")

_BUILD_FILE_CONTENT='''

native.py_library(
    name = "pkg",
    srcs = glob(["**/*.py"]),
    data = glob(["**/*"], exclude=[
        "**/*.py", "BUILD", "BUILD.bazel", "WORKSPACE", "*.whl.zip", "**/*.ipynb"
    ]),
    imports = ["."],
    visibility = ["//visibility:public"],
)
'''

def pypi_libraries():

    native.py_library(
        name = "click",
        deps = [
        ] + ["@pypi__click_7_0//:pkg"],
        visibility=["//visibility:public"],
    )

    native.py_library(
        name = "mock",
        deps = [
            "pbr",
            "six",
        ] + ["@pypi__mock_2_0_0//:pkg"],
        visibility=["//visibility:public"],
    )

    native.py_library(
        name = "pbr",
        deps = [
        ] + ["@pypi__pbr_5_4_3//:pkg"],
        visibility=["//visibility:public"],
    )

    native.py_library(
        name = "py",
        deps = [
        ] + ["@pypi__py_1_8_0//:pkg"],
        visibility=["//visibility:public"],
    )

    native.py_library(
        name = "pytest",
        deps = [
            "py",
        ] + ["@pypi__pytest_2_8_2//:pkg"],
        visibility=["//visibility:public"],
    )

    native.py_library(
        name = "six",
        deps = [
        ] + ["@pypi__six_1_12_0//:pkg"],
        visibility=["//visibility:public"],
    )



def pypi_archives():
    existing_rules = native.existing_rules()
    if "pypi__click_7_0" not in existing_rules:
        http_archive(
            name = "pypi__click_7_0",
            urls = ["https://files.pythonhosted.org/packages/fa/37/45185cb5abbc30d7257104c434fe0b07e5a195a6847506c074527aa599ec/Click-7.0-py2.py3-none-any.whl"],
            sha256 = "2335065e6395b9e67ca716de5f7526736bfa6ceead690adf616d925bdc622b13",
            build_file_content = _BUILD_FILE_CONTENT,
            type = "zip",
        )

    if "pypi__mock_2_0_0" not in existing_rules:
        http_archive(
            name = "pypi__mock_2_0_0",
            urls = ["https://files.pythonhosted.org/packages/e6/35/f187bdf23be87092bd0f1200d43d23076cee4d0dec109f195173fd3ebc79/mock-2.0.0-py2.py3-none-any.whl"],
            sha256 = "5ce3c71c5545b472da17b72268978914d0252980348636840bd34a00b5cc96c1",
            build_file_content = _BUILD_FILE_CONTENT,
            type = "zip",
        )

    if "pypi__pbr_5_4_3" not in existing_rules:
        http_archive(
            name = "pypi__pbr_5_4_3",
            urls = ["https://files.pythonhosted.org/packages/46/a4/d5c83831a3452713e4b4f126149bc4fbda170f7cb16a86a00ce57ce0e9ad/pbr-5.4.3-py2.py3-none-any.whl"],
            sha256 = "b32c8ccaac7b1a20c0ce00ce317642e6cf231cf038f9875e0280e28af5bf7ac9",
            build_file_content = _BUILD_FILE_CONTENT,
            type = "zip",
        )

    if "pypi__py_1_8_0" not in existing_rules:
        http_archive(
            name = "pypi__py_1_8_0",
            urls = ["https://files.pythonhosted.org/packages/76/bc/394ad449851729244a97857ee14d7cba61ddb268dce3db538ba2f2ba1f0f/py-1.8.0-py2.py3-none-any.whl"],
            sha256 = "64f65755aee5b381cea27766a3a147c3f15b9b6b9ac88676de66ba2ae36793fa",
            build_file_content = _BUILD_FILE_CONTENT,
            type = "zip",
        )

    if "pypi__pytest_2_8_2" not in existing_rules:
        http_archive(
            name = "pypi__pytest_2_8_2",
            urls = ["https://files.pythonhosted.org/packages/08/8b/d6225fbe08f4d5c1b4ff05d274596f76003064dfb3ac6aa483790d1bdd08/pytest-2.8.2-py2.py3-none-any.whl"],
            sha256 = "8699d2ae342f211d1cc67dd05111b91925609aef7d294831584f737f65a4f41d",
            build_file_content = _BUILD_FILE_CONTENT,
            type = "zip",
        )

    if "pypi__six_1_12_0" not in existing_rules:
        http_archive(
            name = "pypi__six_1_12_0",
            urls = ["https://files.pythonhosted.org/packages/73/fb/00a976f728d0d1fecfe898238ce23f502a721c0ac0ecfedb80e0d88c64e9/six-1.12.0-py2.py3-none-any.whl"],
            sha256 = "3350809f0555b11f552448330d0b52d5f24c91a322ea4a15ef22629740f3761c",
            build_file_content = _BUILD_FILE_CONTENT,
            type = "zip",
        )


def requirement(name):
    name_key = name.replace("-", "_").lower()  # allow use of dashes and uppercase
    return "//3rdparty/python:{}".format(name_key)
