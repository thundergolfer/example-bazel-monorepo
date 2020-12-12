from collections import defaultdict
import hashlib
import os
import sys
import zipfile


def _check_for_duplicate_classes(class_path_to_jar_paths, whitelisted_jars):
    """
    Prints error message and returns True if duplicate classes were found,
    false otherwise.

    Jars in the whitelisted_jars list are excluded from the check.
    """

    found_duplicates = False

    for class_path, jars in class_path_to_jar_paths.items():
        if len(jars) > 1:
            jar_path_and_md5s = []
            all_hash_digests_match = True
            previous_digest = None
            previous_jar_path = None
            for jar_path in jars:
                jar = zipfile.ZipFile(jar_path, "r")
                class_bytes = jar.read(class_path)
                digest = hashlib.md5(class_bytes).hexdigest()
                jar_path_and_md5s.append(
                    (
                        jar_path,
                        digest,
                    )
                )
                if previous_digest is not None:
                    if previous_digest != digest:
                        if (
                            os.path.basename(jar_path) not in whitelisted_jars
                            or os.path.basename(previous_jar_path) not in whitelisted_jars
                        ):
                            all_hash_digests_match = False
                            found_duplicates = True
                previous_digest = digest
                previous_jar_path = jar_path
            if not all_hash_digests_match:
                print(
                    "The class [%s] was found in multiple jars:\n%s\n\n"
                    % (class_path, "\n".join((str(t) for t in jar_path_and_md5s)))
                )

    return found_duplicates


JARNAME_PREFIX = "Jarname: "


def _parse_classes_index_file(filename):
    """
    Reads all lines from the specified file, and looks for lines that either
    start with "Jarname:" or end with ".class".

    Returns a dictionary, mapping the class (path to class) to all jars it was
    found in.
    """

    # maps the path to a class to all jars (as list) it was found in,
    # for example:
    # com/salesforce/sconems/abstractions/HostUtil.class ->
    # [bazel-out/.../foolib.jar, bazel-out/.../blahlib.jar]
    class_path_to_jar_paths = defaultdict(list)

    # keeps track of the current jar being processed
    current_jar_path = None

    with open(filename, "r") as lines:
        for line in lines:
            line = line.strip()
            if line.startswith(JARNAME_PREFIX):
                current_jar_path = line[len(JARNAME_PREFIX) :].strip()
            elif line.endswith(".class"):
                # a line looks like this, get the path to the class only
                # 2624  01-01-1980 00:00   com/salesforce/sconems/abstractions/BeanCreationFailureAnalyzer.class
                class_path = line.split()[-1].strip()
                if class_path.endswith("module-info.class"):
                    # W-5899212
                    continue
                if current_jar_path is None:
                    raise Exception("Jar not found for class " + class_path)
                else:
                    class_path_to_jar_paths[class_path].append(current_jar_path)

    return class_path_to_jar_paths


def _parse_whitelisted_jars_file(whitelist_file):
    """
    Reads the whitelist.txt file and returns the jars as a set.
    """
    whitelisted_jars = set()

    with open(whitelist_file, "r") as lines:

        for line in lines:
            line = line.strip()
            if len(line) == 0 or line.startswith("#"):
                continue
            # cannot use the whole jar path as it is different for generated jars on SFCI and mac
            # this logic might need to change if two jars with the same name are part of the whitelist
            whitelisted_jars.add(os.path.basename(line))

    return whitelisted_jars


def run(classes_index_file_path, whitelisted_jar_path):
    whitelisted_jars = _parse_whitelisted_jars_file(whitelisted_jar_path)
    class_path_to_jar_paths = _parse_classes_index_file(classes_index_file_path)
    found_duplicates = _check_for_duplicate_classes(class_path_to_jar_paths, whitelisted_jars)
    if found_duplicates:
        raise Exception("Found duplicate classes in the packaged springboot jar")


if __name__ == "__main__":
    run(sys.argv[1], sys.argv[2])
