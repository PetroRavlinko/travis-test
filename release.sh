#!/usr/bin/env sh

mvn clean
git checkout master
snapshotVersion=$(mvn help:evaluate -Dexpression=project.version | tail -8 | head -1)
IFS='-' eval 'version=($snapshotVersion)'
mvn -B release:prepare
mvn release:branch -DbranchName=travis-test-$version[1]
mvn -B release:perform