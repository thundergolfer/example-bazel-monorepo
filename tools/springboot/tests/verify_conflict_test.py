import os
import subprocess
import tempfile
import shutil
import unittest
from tools.springboot import verify_conflict
import platform

FAKE_CONT1 = "This is some class bytecode"
FAKE_CONT2 = "This is some other class bytecode"
WHITELIST_PATH = ""


class TestVerifyConflict(unittest.TestCase):
    def setUp(self):
        global WHITELIST_PATH
        self.tempdir = tempfile.mkdtemp("TestVerifyConflict")
        WHITELIST_PATH = self._write_whitelist_file()

    def tearDown(self):
        shutil.rmtree(self.tempdir)

    def test_single_jar_with_two_unique_class(self):
        classes_dir = self._create_fake_class(
            "MyClass.class", "classes", "com/salesforce", FAKE_CONT1
        )
        classes_dir = self._create_fake_class(
            "MyClass2.class", "classes", "com/salesforce", FAKE_CONT2
        )
        jar_file = self._create_jar("myjar.jar", classes_dir)
        self._run("jar tf %s" % jar_file)

        index_file_path = self._write_index_file([jar_file])
        verify_conflict.run(index_file_path, WHITELIST_PATH)

    def test_two_jars_with_duplicate_class__same_content(self):
        classes_dir1 = self._create_fake_class(
            "MyClass.class", "classes1", "com/salesforce", FAKE_CONT1
        )
        # make the jar more interesting: add another class
        self._create_fake_class("MyClass2.class", "classes1", "com/salesforce", FAKE_CONT2)
        classes_dir2 = self._create_fake_class(
            "MyClass.class", "classes2", "com/salesforce", FAKE_CONT1
        )
        jar_file1 = self._create_jar("myjar1.jar", classes_dir1)
        jar_file2 = self._create_jar("myjar2.jar", classes_dir2)

        index_file_path = self._write_index_file([jar_file1, jar_file2])

        verify_conflict.run(index_file_path, WHITELIST_PATH)

    def test_two_jars_with_duplicate_class__different_content(self):
        classes_dir1 = self._create_fake_class(
            "MyClass.class", "classes1", "com/salesforce", FAKE_CONT1
        )
        classes_dir2 = self._create_fake_class(
            "MyClass.class", "classes2", "com/salesforce", FAKE_CONT2
        )
        jar_file1 = self._create_jar("myjar1.jar", classes_dir1)
        jar_file2 = self._create_jar("myjar2.jar", classes_dir2)

        index_file_path = self._write_index_file([jar_file1, jar_file2])

        with self.assertRaises(Exception) as ctx:
            verify_conflict.run(index_file_path, WHITELIST_PATH)

        self.assertIn("Found duplicate classes", str(ctx.exception))

    def test_two_jars_with_duplicate_class_whitelisted__different_content(self):
        classes_dir1 = self._create_fake_class(
            "MyClass.class", "classes1", "com/salesforce", FAKE_CONT1
        )
        classes_dir2 = self._create_fake_class(
            "MyClass.class", "classes2", "com/salesforce", FAKE_CONT2
        )
        jar_file1 = self._create_jar("myjar20.jar", classes_dir1)
        jar_file2 = self._create_jar("myjar21.jar", classes_dir2)

        index_file_path = self._write_index_file([jar_file1, jar_file2])

        verify_conflict.run(index_file_path, WHITELIST_PATH)

    def _create_jar(self, name, classes_dir):
        jar_file = os.path.join(self.tempdir, name)
        self._run("jar cf %s %s" % (jar_file, "."), cwd=classes_dir)
        assert os.path.exists(jar_file)
        return jar_file

    def _create_fake_class(self, name, root_dir, package, content):
        classes_dir = os.path.join(self.tempdir, root_dir)
        package_dir = os.path.join(classes_dir, package)
        if not os.path.exists(package_dir):
            os.makedirs(package_dir)
        class_file = os.path.join(package_dir, name)
        with open(class_file, "w") as f:
            f.write(content)
        return classes_dir

    def _write_index_file(self, jar_files):
        index_file_path = os.path.join(self.tempdir, "classes.txt")
        print(index_file_path)
        with open(index_file_path, "wb") as f:
            for jar_file in jar_files:
                f.write(("%s%s\n" % (verify_conflict.JARNAME_PREFIX, jar_file)).encode())
                f.write(self._run("unzip -l %s" % jar_file))
        return index_file_path

    def _write_whitelist_file(self):
        whitelist_file_path = os.path.join(self.tempdir, "whitelist.txt")
        with open(whitelist_file_path, "w") as f:
            f.write(self.tempdir + "/myjar20.jar\n")
            f.write(self.tempdir + "/myjar21.jar\n")
        return whitelist_file_path

    def _run(self, cmd, cwd=None):
        if not cwd:
            cwd = self.tempdir
        output = subprocess.Popen(cmd, cwd=cwd, shell=True, stdout=subprocess.PIPE).stdout.read()
        return output


if __name__ == "__main__":
    unittest.main()
