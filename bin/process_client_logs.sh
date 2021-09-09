#!/bin/bash

#Takes a directory as a command line argument and does all its work in that directory.

#Moves to the specified directory.
cd ../"$1"

cat *.tgz | tar -xzvf - -i

#awk 'match("$0", /([a-zA-Z0-9]:_[])/ Failed password for /([a-zA-Z0-9])/, groups) {print groups[1] groups[2]}'
