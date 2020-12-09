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
import re

PACKAGE_PATTERN = re.compile("from (?P<original_package>.*) import (?:.*) as (?:.*)")

parser = argparse.ArgumentParser()
parser.add_argument('--src', help='Source file')
parser.add_argument('--dest', help='Destination file')
parser.add_argument('--pkg', help='Package to prepend')
parser.add_argument('--all_pkgs', nargs='+', help='All packages in this source set')
args = parser.parse_args()

with open(args.src) as srcf, open(args.dest, 'w') as destf:
    lines = srcf.readlines()
    for i, line in enumerate(lines):
        match = PACKAGE_PATTERN.match(line)
        if match:
            original_package = match.group('original_package')
            if original_package in args.all_pkgs:
                package = '{}.{}'.format(args.pkg, original_package)
                lines[i] = line.replace(
                    'from {}'.format(original_package),
                    'from {}'.format(package)
                )
    destf.writelines(lines)
