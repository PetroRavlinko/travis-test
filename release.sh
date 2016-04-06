#!/usr/bin/env sh

pwd=$(pwd)
echo "pwd = ${pwd}"

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
mvn versions:commit

echo "Pushing release $version to the master"
git add pom.xml
git commit -m "Release v${version}"
echo "Pushing release to master"
git push --force --quiet "https://${GIT_TOKEN}@github.com/${GIT_USER_ACCOUNT}/travis-test.git" master > /dev/null 2>&1

echo "Pushing $version tag"
git tag -a v${version} -m "Release of version ${version}"
echo "Pushing release tag"
git push --force --quiet "https://${GIT_TOKEN}@github.com/${GIT_USER_ACCOUNT}/travis-test.git" --tags > /dev/null 2>&1

echo "Creating tag"
release_json='{ "tag_name": "v'"${version}"'", "target_commitish": "master", "name": "v'"${version}"'", "body": "Release of version '"${version}"'", "draft": false, "prerelease": false}'
echo "Releasing: ${release_json}"
curl -u "${GIT_USER_ACCOUNT}:${GIT_PASSWORD}" -H "Content-Type: application/json" -X POST -d "${release_json}" https://api.github.com/repos/"${GIT_USER_ACCOUNT}"/travis-test/releases

mvn deploy

echo "Creating $version branch"
git checkout -b ${version}
echo "Pushing release branch"
git push --force --quiet "https://${GIT_TOKEN}@github.com/${GIT_USER_ACCOUNT}/travis-test.git" ${version} > /dev/null 2>&1

echo "Updating to the new ${version}-SNAPSHOT version"
git checkout master
mvn -B release:update-versions
git add pom.xml
git commit -m "Prepare for the next development version"
echo "Pushing new development version"
git push --force --quiet "https://${GIT_TOKEN}@github.com/${GIT_USER_ACCOUNT}/travis-test.git" master > /dev/null 2>&1