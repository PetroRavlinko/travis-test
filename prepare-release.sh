#!/usr/bin/env sh

mvn clean
git checkout master
mvn -B release:prepare