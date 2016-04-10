echo "Getting current version"
snapshotVersion=$(mvn help:evaluate -Dexpression=project.version | tail -8 | head -1)

echo "Deploying ${snapshotVersion}"

mvn clean deploy