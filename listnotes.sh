#!/bin/bash
# File   : listnotes.sh
# Date   : 2022.11.12
# Author : Lyndon Hill
# Brief  : List and search notes

NOTEDIR="${HOME}/Documents/Notes"
LOGDIR="${HOME}/Documents/Logs"

echo "Searching..."

# When no arguments to this script list all notes
if [ $# = 0 ]; then
  ls -t ${NOTEDIR}
  exit 0
fi

# With arguments list all notes with argument in filename and grep all files
for keyword in "$@"
do
  find ${NOTEDIR} | grep .$keyword*
  grep -lr "$keyword" ${NOTEDIR}/*
  grep -lr "$keyword" ${LOGDIR}/*
done

# TODO using ls and grep means there can be duplicates
