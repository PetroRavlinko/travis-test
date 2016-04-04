#!/usr/bin/env sh

version=-1

echo "mvn clean"
mvn clean
echo "git checkout master"
git checkout master

echo "Getting current version"
snapshotVersion=$(mvn help:evaluate -Dexpression=project.version | tail -8 | head -1)
echo "The current version is ${snapshotVersion}"
version=${snapshotVersion%-SNAPSHOT}

echo "mvn -B release:prepare"
mvn -B release:prepare
echo "mvn release:branch -DbranchName=travis-test-${version}"
mvn release:branch -DbranchName=travis-test-${version}
echo "mvn -B release:perform"
mvn -B release:perform