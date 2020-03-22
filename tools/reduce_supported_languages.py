#!/usr/bin/env python3
"""
This script is used to adapt the Bazel workspace so that certain languages
are no longer built. This can be used when wanting to avoid difficult setup of prerequisites
or if you just don't care about a particular language and want to remove support.
"""
import argparse
import pathlib
import subprocess
import re


class BColors:
    HEADER = '\033[95m'
    OKBLUE = '\033[94m'
    OKGREEN = '\033[92m'
    WARNING = '\033[93m'
    FAIL = '\033[91m'
    ENDC = '\033[0m'
    BOLD = '\033[1m'
    UNDERLINE = '\033[4m'


REPO_ROOT = subprocess.run(
    "git rev-parse --show-toplevel",
    shell=True,
    check=True,
    capture_output=True,
).stdout.decode().strip()

REMOVEABLE_LANGUAGES = {"ruby", "rust", "typescript"}
BAZELIGNORE_LINES = {
    "ruby": [
        "ruby/"
    ],
    "rust": [
        "rust/"
    ],
    "typescript": [
        "frontend/"
    ]
}

def display_instructions(bazel_workspace_file, target_lang, p):
    print(f"{BColors.OKGREEN}1. Add the following lines to {pathlib.Path(REPO_ROOT, '.bazelignore')}{BColors.ENDC}")
    print(f"{BColors.OKGREEN}   Alternatively, remove the folders.{BColors.ENDC}")
    print(BColors.OKGREEN + ("-" * 50) + BColors.ENDC)
    print("\n".join(BAZELIGNORE_LINES[target_lang]))
    print()
    print(f"{BColors.OKGREEN}2. Comment-out or remove the following part of the {bazel_workspace_file}{BColors.ENDC}")
    print(BColors.OKGREEN + ("-" * 50) + BColors.ENDC)
    print(p)
    exit(0)


def main(target_lang):
    if target_lang not in REMOVEABLE_LANGUAGES:
        print(
            f"This script supports removing the following languages from the WORKSPACE: {REMOVEABLE_LANGUAGES}\n"
            f"Language '{target_lang}' is not removeable."
        )
        exit(1)

    bazel_workspace_file = pathlib.Path(REPO_ROOT, "WORKSPACE")
    with open(bazel_workspace_file, "r") as f:
        workspace_contents = f.read()

    pttrn = re.compile(r"#{10,50}\n# [\w\/\s]+\n#{10,50}")
    parts = pttrn.split(workspace_contents)

    for p in parts:
        if target_lang in p:
            display_instructions(
                bazel_workspace_file,
                target_lang,
                p
            )


if __name__ == "__main__":
    parser = argparse.ArgumentParser(description='XXXX.')
    parser.add_argument(
        "target_language",
        help="YYYY"
    )
    args = parser.parse_args()
    main(args.target_language)