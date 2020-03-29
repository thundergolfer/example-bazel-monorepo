#!/bin/bash
# This should be copied into the store-api.tf locals after updating.

set -o errexit
set -o nounset
set -o pipefail

RELEASE_BUCKET="s3://example-bazel-monorepo-artifacts"

# Install Java Runtime Environment (JRE 11)
sudo apt-get -y install default-jdk
# Install Postgres
sudo apt-get -y install postgresql postgresql-contrib
# Setup DB
sudo su - postgres
createuser -s ubuntu
su - ubuntu
createdb bookstore_api

# ⚠️ This is terrible security, but it will have to do for now. There's nothing of value in the DB.
sudo su - postgres
# Trust all local connections, not requiring password. Avoids the following:
# 'org.postgresql.util.PSQLException: The server requested password-based authentication, but no password was provided.'
sed -i 's/host    all             all             127.0.0.1\/32            md5/host    all             all             127.0.0.1\/32            trust/g' /etc/postgresql/10/main/pg_hba.conf
sudo service postgresql reload

su - ubuntu

aws s3 cp "$RELEASE_BUCKET/4f2f87949d9ce6f40617268d25dd6ed6d9a8f417/store-api/src/main/java/com/book/store/api/deployable.jar" "$HOME"

java -jar "$HOME/deployable.jar"
# The API will be available @ something like http://{EC2 Public DNS}:8080, eg. http://ec2-3-15-180-230.us-east-2.compute.amazonaws.com:8080
