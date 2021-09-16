#!/bin/bash

#The given directory is assumed to have the correct files.
#Assumes that this script will be called in the top directory

#Stores the name of the given directory
dir="$1"

temp=$(mktemp /tmp/tmp.XXXXXXXXXX)

#cat "$dir"/*/failed_login_data.txt | awk '{ print $5 }' > IP-data.txt

cd "$dir"

awk '{print $5}' <failed_login_data.txt>IP-data.txt

#sort IP-data.txt |
join <(sort IP-data.txt) <(sort country_IP_map.txt) > output.txt
# | uniq -c | awk '{ printf("data.addRow([\x27%s\x27, %d]);\n", $2, $1) }' > "$temp"

#./bin/wrap_contents.sh "$temp" html_components/country_dist "$dir"/country_dist.html

#rm "$temp"
