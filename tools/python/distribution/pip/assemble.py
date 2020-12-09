#!/usr/bin/env python

#
# Licensed to the Apache Software Foundation (ASF) under one
# or more contributor license agreements.  See the NOTICE file
# distributed with this work for additional information
# regarding copyright ownership.  The ASF licenses this file
# to you under the Apache License, Version 2.0 (the
# "License"); you may not use this file except in compliance
# with the License.  You may obtain a copy of the License at
#
#   http://www.apache.org/licenses/LICENSE-2.0
#
# Unless required by applicable law or agreed to in writing,
# software distributed under the License is distributed on an
# "AS IS" BASIS, WITHOUT WARRANTIES OR CONDITIONS OF ANY
# KIND, either express or implied.  See the License for the
# specific language governing permissions and limitations
# under the License.
#

import argparse
import glob
import os
import re
import shutil
import tempfile
from distutils.core import run_setup


def create_init_files(directory):
    from os import walk
    from os.path import join
    for dirName, subdirList, fileList in walk(directory):
        if "__init__.py" not in fileList:
            open(join(dirName, "__init__.py"), "w").close()


parser = argparse.ArgumentParser()
parser.add_argument('--output', help="Output archive")
parser.add_argument('--setup_py', help="setup.py")
parser.add_argument('--readme', help="README file")
parser.add_argument('--files', nargs='+', help='Python files to pack into archive')
parser.add_argument('--imports', nargs='+', help='Folders considered to be source code roots')

args = parser.parse_args()

# absolutize the path
args.output = os.path.abspath(args.output)
# turn imports into regex patterns
args.imports = list(map(
    lambda imp: re.compile('(?:.*){}[/]?(?P<fn>.*)'.format(imp)),
    args.imports or []
))

# new package root
pkg_dir = tempfile.mkdtemp()


for f in args.files:
    fn = f
    for _imp in args.imports:
        match = _imp.match(fn)
        if match:
            fn = match.group('fn')
            break
    try:
        e = os.path.join(pkg_dir, os.path.dirname(fn))
        os.makedirs(e)
    except OSError:
        # directory already exists
        pass
    shutil.copy(f, os.path.join(pkg_dir, fn))

setup_py = os.path.join(pkg_dir, 'setup.py')
readme = os.path.join(pkg_dir, 'README.md')
shutil.copy(args.setup_py, setup_py)
shutil.copy(args.readme, readme)

with open(os.path.join(pkg_dir, 'setup.cfg'), 'w') as setup_cfg:
    setup_cfg.writelines([
        '[bdist_wheel]\n',
        'universal = 1\n'
    ])

# change directory into new package root
os.chdir(pkg_dir)

# ensure every folder is a Python package
create_init_files(pkg_dir)

# pack sources
run_setup(setup_py, ['sdist'])

archives = glob.glob('dist/*.tar.gz')
if len(archives) != 1:
    raise Exception('archive expected was not produced by sdist')

shutil.copy(archives[0], args.output)
shutil.rmtree(pkg_dir)
