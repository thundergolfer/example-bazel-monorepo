#!/bin/bash
# This should be copied into the store-api.tf locals after updating.

set -o nounset
set -o pipefail

RELEASE_BUCKET="s3://example-bazel-monorepo-artifacts"
USER="root" # userdata runs as 'root' user

apt-get -y update

# Install Java Runtime Environment (JRE 11)
apt-get -y install default-jdk
# Install Postgres
apt-get -y install postgresql postgresql-contrib
# Install AWS CLI
apt -y install awscli

# Setup DB
sudo -u postgres createuser -s $USER

createdb bookstore_api

# ⚠️ This is terrible security, but it will have to do for now. There's nothing of value in the DB.
# Trust all local connections, not requiring password. Avoids the following:
# 'org.postgresql.util.PSQLException: The server requested password-based authentication, but no password was provided.'
sudo -u postgres sed -i 's/host    all             all             127.0.0.1\/32            md5/host    all             all             127.0.0.1\/32            trust/g' /etc/postgresql/10/main/pg_hba.conf
service postgresql reload

aws s3 cp "$RELEASE_BUCKET/398f2d5620c3e681f4304776eb137690c52cbfab/store-api/src/main/java/com/book/store/api/deployable.jar" "."

# TODO(Jonathon): Production server should be listening on 80(HTTP) or 443 (HTTPS) not default (8080)
# Run jar, adding '&' to run in background
java -jar "./deployable.jar" &
# The API will be available @ something like http://{EC2 Public DNS}:8080, eg. http://ec2-3-15-180-230.us-east-2.compute.amazonaws.com:8080
