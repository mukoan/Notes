#!/bin/bash
# File   : note.sh
# Date   : 2022.10.14
# Author : Lyndon Hill
# Brief  : Make a note

# Set this to 1 to add an optional header, 0 to disable
ADDHEADER=1

# Get note name or default to "note"
TITLE="note"
if [ $# -gt 0 ]; then
  TITLE="$1"
fi

DATE=$(date +"%Y%m%d")
NOTENAME="${HOME}/Documents/Notes/${TITLE}${DATE}"

if test -f "$NOTENAME"; then
  echo "File $NOTENAME already exists"
  exit 1
fi

if [ $ADDHEADER -gt 0 ]; then
  # Add header
  HEADERDATE=$(date +"%Y-%m-%dT%T")
  printf "title = ${TITLE}\ndate = ${HEADERDATE}\n" >> ${NOTENAME}
  printf "tags =\npath = ${NOTENAME}\n\n\n" >> ${NOTENAME}
fi

# Set your favourite text editor here
gvim + ${NOTENAME}
