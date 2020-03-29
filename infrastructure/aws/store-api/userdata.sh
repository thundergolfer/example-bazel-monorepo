#!/bin/bash
# This should be copied into the store-api.tf locals after updating.

# Install Java Runtime Environment (JRE 11)
sudo apt install default-jdk
# Install Postgres
sudo apt-get install postgresql postgresql-contrib
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

# java -jar deployable.jar
# The API will be available @ something like http://{EC2 Public DNS}:8080, eg. http://ec2-3-15-180-230.us-east-2.compute.amazonaws.com:8080
