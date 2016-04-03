#!/bin/bash

echo "Changing maven configuration"
echo "Moving new settings.xml to /usr/local/maven/"

sudo mv settings.xml /usr/local/maven/settings.xml

echo "New Maven configuration DONE"

