#!/usr/bin/env bash

#cd into the directory and go into its subdirectories or exit if the cd failed
cd "$1"/var/log || exit

#Concatenate all files in the directory
#pipe cat into an awk command
#then pipe that into a sed command
#then print to failed_login_data.txt
cat ./* | awk 'match("$0", /([a-zA-Z0-9]) Failed password ([a-zA-Z0-9.])/, groups) {print groups[1] groups[2]}' >  failed_login_data.txt


#Move the failed_login_data.txt file back into directory stored in the directory variable
mv failed_login_data.txt ../../
