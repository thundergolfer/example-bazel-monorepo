#
# Copyright (c) 2017-9, salesforce.com, inc.
# All rights reserved.
# Licensed under the BSD 3-Clause license.
# For full license text, see LICENSE.txt file in the repo root  or https://opensource.org/licenses/BSD-3-Clause
#

# Spring Boot Packager
# (implemented by Salesforce)

# See the README.md file for detailed usage instructions.

exports_files([
    "springboot.bzl",
    "springboot_pkg.sh",
    "verify_conflict.py",
    "write_gitinfo_properties.sh",
    "write_manifest.sh",
    "whitelist.txt",
])

py_test(
    name = "verify_conflict_test",
    size = "small",
    srcs = [
        "tests/verify_conflict_test.py",
        "verify_conflict.py",
    ],
    imports = ["."],
)
