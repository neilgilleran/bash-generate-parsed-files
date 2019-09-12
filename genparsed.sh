#!/bin/bash

# Remember to install the bdfile-inspector first with
# npm install
# Usage: 
# In the folder you want to (re-)generate the .parsed files:
# find . -name "*BDF*" -exec ../tools/./genparsed.sh {} \;

SID=$(dirname $1)
OUTFILE="${SID}/${SID}.parsed"
echo "Writing $OUTFILE..."
node ./bdfile-inspector $1 > $OUTFILE