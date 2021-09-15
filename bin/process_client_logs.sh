#!/bin/bash

#cd into the directory and go into its subdirectories or exit if the cd failed
cd "$1" || exit

cat var/log/* | awk 'match($0, /([a-zA-Z]{3} [0-9 ]{2}) ([0-9]{2})[0-9:]+ .+ Failed password .+ ([a-zA-z0-9 ]+) from ([0-9.]+)/, groups) {print groups[1]  groups[2]  groups[3] groups[4] "\n" }' > failed_login_data.txt

