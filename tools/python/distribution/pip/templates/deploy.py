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
import shutil
import sys


sys.path.extend(map(os.path.abspath, glob.glob('external/*/')))
# noinspection PyUnresolvedReferences
import twine.commands.upload

parser = argparse.ArgumentParser()
parser.add_argument('repo_type')
args = parser.parse_args()

repo_type_key = args.repo_type

pip_repositories = {
    'snapshot' : "{snapshot}",
    'release' : "{release}"
}

pip_registry = pip_repositories[repo_type_key]

pip_username, pip_password = (
    os.getenv('DEPLOY_PIP_USERNAME'),
    os.getenv('DEPLOY_PIP_PASSWORD'),
)

if not pip_username:
    raise Exception(
        'username should be passed via '
        'DEPLOY_PIP_USERNAME env variable'
    )

if not pip_password:
    raise Exception(
        'password should be passed via '
        '$DEPLOY_PIP_PASSWORD env variable'
    )

with open("{version_file}") as version_file:
    version = version_file.read().strip()

new_package_file = None

try:
    new_package_file = "{package_file}".replace(".tar.gz", "-{}.tar.gz".format(version))
    shutil.copy("{package_file}", new_package_file)

    twine.commands.upload.main([
        new_package_file,
        '-u',
        pip_username,
        '-p',
        pip_password,
        '--repository-url',
        pip_registry
    ])
finally:
    if new_package_file:
        os.remove(new_package_file)
