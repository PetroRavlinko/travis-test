#!/usr/bin/env sh

echo "Starting build node configuration..."
echo "Moving new settings.xml to MAVEN_HOME"

cp settings.xml $HOME/.m2/settings.xml

echo "------------------------------------------------------------------------"
echo "The new mvn settings are"
echo "------------------------------------------------------------------------"
cat $HOME/.m2/settings.xml
echo
echo "------------------------------------------------------------------------"

echo "New Maven configuration... DONE"

echo "Configuring git"
git config --global user.email $GIT_USER_EMAIL
git config --global user.name $GIT_USER_NAME
echo "Git configuration... DONE"
