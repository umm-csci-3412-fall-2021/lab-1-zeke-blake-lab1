#!/bin/bash

#Takes a directory name as an argument and cats all of the
#html files present in that directory together.

dir="$1"

temp=$(mktemp /tmp/tmp.XXXXXXXXXX)

cat "$dir"/*.html > "$temp"

./bin/wrap_contents.sh "$temp" html_components/summary_plots "$dir"/failed_login_summary.html

