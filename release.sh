#!/usr/bin/env sh

version=-1

echo "mvn clean"
mvn clean
echo "git checkout master"
git checkout master

echo "mvn -B release:prepare"
mvn -B release:prepare
echo "mvn -B release:perform"
mvn -B release:perform