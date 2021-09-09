#!/bin/bash

#Takes a directory in log_files as a command line argument and does all its work in that directory.

#Moves to the specified directory.
cd "$1"

#Combines all the text files in the specified directory.
cat /var/log/*

#awk 'match("$0", /([a-zA-Z0-9]:_[])/ Failed password for /([a-zA-Z0-9])/, groups) {print groups[1] groups[2]}'
