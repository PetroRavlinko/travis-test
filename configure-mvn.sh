#!/usr/bin/env sh

echo "Changing maven configuration"
echo "Moving new settings.xml to /usr/local/maven/"

sudo mv settings.xml $HOME/.m2/settings.xml

ls $HOME/.m2/

echo "Print content of /usr/local/maven/"

ls /usr/local/maven/

echo "New Maven configuration DONE"

