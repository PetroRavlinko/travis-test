#!/usr/bin/env sh

echo "Changing maven configuration"
echo "Moving new settings.xml to MAVEN_HOME"

mv settings.xml $HOME/.m2/settings.xml

echo "------------------------------------------------------------------------"
echo "The new mvn settings are"
echo "------------------------------------------------------------------------"
cat $HOME/.m2/settings.xml
echo "------------------------------------------------------------------------"

echo "New Maven configuration DONE"

