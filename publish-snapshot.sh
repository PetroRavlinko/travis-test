#!/usr/bin/env sh

echo "Publishing Snapshot"
echo "mvn clean"
mvn clean
echo "git checkout master"
git checkout master
echo "mvn deploy"
mvn deploy