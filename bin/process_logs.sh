#!/bin/bash

#Takes a set of gzipped tar files on the command line

here=$(pwd)

TMPDIR=$(mktemp -d)

#Loop over the .tgz files in log_files
#and call process_client_logs for each
#extracted tar file.
for var in "$@"; do
 logs=$(basename "$var" .tgz)
 mkdir "$TMPDIR"/"$logs"
 tar -zxf "$var" -C "$TMPDIR"/"$logs"
 ./bin/process_client_logs.sh "$TMPDIR"/"$logs"
done

./bin/create_username_dist.sh "$TMPDIR"
./bin/create_hours_dist.sh "$TMPDIR"
./bin/create_country_dist.sh "$TMPDIR"
./bin/assemble_report.sh "$TMPDIR"

mv "$TMPDIR"/failed_login_summary.html "$here"

rm -rf "$TMPDIR"
