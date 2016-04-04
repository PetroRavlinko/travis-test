#!/usr/bin/env sh

mvn clean
git checkout master
mvn -B release:prepare
version=$(mvn help:evaluate -Dexpression=project.version | tail -8 | head -1)
mvn release:branch -DbranchName=$version
mvn -B release:perform