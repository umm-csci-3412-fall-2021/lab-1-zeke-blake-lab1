#!/bin/bash

#cd into the directory and go into its subdirectories or exit if the cd failed
cd "$1" || exit

cat var/log/* | \

awk 'match($0, /([a-zA-z]{3})  ?([0-9]{1,2}) ([0-9]{2})[0-9:]+ .+ Failed password .+ (.*) from ([0-9.]+)/, groups) {print groups[1] " " groups[2] " " groups[3] " " groups[4]  " " groups[5]}' > failed_login_data.txt

#awk 'match($0, /([a-zA-Z]{3}) [[:space:]] ([0-9]{2}) [[:space:]] ([0-9]{2}) [[:space:]] ([a-zA-Z0-9.]+)/, groups) {print groups[1] " " groups[2] " " groups[3] " " groups[4]}' < failed_login_data.txt > output.txt
