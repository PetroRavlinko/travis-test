#!/usr/bin/env sh

echo "mvn clean"
mvn clean
echo "git checkout master"
git checkout master

echo "Getting current version"
snapshotVersion=$(mvn help:evaluate -Dexpression=project.version | tail -8 | head -1)

echo "The current version is ${snapshotVersion}"
version=${snapshotVersion%-SNAPSHOT}

echo "Changing project version to the release version v$version"

echo "mvn versions:set -DnewVersion=$version"
mvn versions:set -DnewVersion=${version}
rm pom.xml.versionsBackup

echo "Pushing $version branch on github"
git checkout -b ${version}
git add .
git commit -m "Release v${version}"
git push origin ${version}


#echo "mvn -B release:prepare"
#mvn -B release:prepare
#echo "mvn -B release:perform"
#mvn -B release:perform