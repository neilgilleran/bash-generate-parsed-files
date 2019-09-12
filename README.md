# bash-generate-parsed-files

These bash scripts were developed to generate test files. It used the bdfile-inspector developed to parse the relevant data from a set of input files.

* generate.sh
This script automated zipping certain files from a folder. It also included creating another file with a list of relevant files. It also contained a checksum based off the folders name.

* genparsed.sh
This script was used to parse text and rename per the folder name

### Notable linux commands
These are commands that I had little exposure to previously

* find .  -type d
* the -exec function for find was really useful
* tr --delete
* date and all the date configs %d%m%y
* tar -czf tarredfile.tar.gz --files-from=files_to_tar.txt (add v flag to display on stdout)
* awk '{ print $1 }' will return the first portion of a returned value, this was very handy to get the exact cksum
* xargs pipe something through xargs to remove trailing whitespaces
* wrap commands in `` and assign to a variable
* tee -a allows you to append to a file, i noticed cat put the contents into the file. i only wanted the list of files
* "> /dev/null" to supress stdout



