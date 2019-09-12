#!/bin/bash
# Run this from command line using folling
# find . -type d -exec ./generate.sh {} \;
# this will give us a list of directories to iterate over

# comments out the cd $1 for use in a specific folder
cd $1

# Removes any previous instances
rm *.gz
rm *.done

# For the names of the files to include the scenario id
PWD="`pwd`"
SCENARIO=${PWD:34:42}
FOLDERSCENARIO=`echo $SCENARIO | tr --delete .EPBOXGHSAMP-`
echo $FOLDERSCENARIO
BEFOREDATE=`date '+%d%m%Y'`
DATE="$BEFOREDATE""00""$FOLDERSCENARIO"

# get all the bd and gmf files for the tarballed gunzip folder
# > /dev/null is to stop stdout
FILES=`ls --ignore=*txt --ignore=*sh --ignore=*done --ignore=*gz --ignore=*xml --ignore=*pdf --ignore=*parsed | tee files.txt` > /dev/null
TARGZ="BD_""$DATE""_STREAM1.tar.gz"
tar -czf "$TARGZ" --files-from=files.txt

#create a checksum for the files
CKSUM=`cksum $TARGZ | awk '{ print $1 }'`
CKSUM3=`echo $CKSUM | xargs`
DONE="BD_""$DATE""_""$CKSUM3""_STREAM1_of_1.done"

#create a file with a list of all the files
ls *.gz | tee temp.txt > /dev/null
ls --ignore=*txt --ignore=*sh --ignore=*done --ignore=*gz --ignore=*xml --ignore=*pdf --ignore=*parsed | tee -a temp.txt > /dev/null
cp temp.txt "$DONE"

# clean up any random files not needed
rm files.txt
rm temp.txt