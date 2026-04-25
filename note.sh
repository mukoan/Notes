#!/bin/bash
# File   : note.sh
# Date   : 2022.10.14
# Author : Lyndon Hill
# Brief  : Make a note

## Configuration

# Set your favourite text editor here
EDITOR="gvim +"

# Location to store notes
NOTE_LOCATION="${HOME}/Documents/Notes"

# Set this to 1 to add an optional header, 0 to disable
ADDHEADER=1

# Use a .txt extension on all notes
EXTENSION=0

## Main script

DATE=$(date +"%Y%m%d")

# Get note name or default to "note"
TITLE="note"
if [ $# -gt 0 ]; then
  TITLE="$1"
fi

if [[ $TITLE == *[0-9] ]]; then
  # Add an underscore if note name ends with a number
  NOTENAME="${NOTE_LOCATION}/${TITLE}_${DATE}"
else
  NOTENAME="${NOTE_LOCATION}/${TITLE}${DATE}"
fi

if [ $EXTENSION -gt 0 ]; then
  NOTENAME="${NOTENAME}.txt"
fi

if test -f "$NOTENAME"; then
  echo "Note for '$TITLE' already exists; either choose a different title or"
  echo "edit the existing note, e.g. ${EDITOR} ${NOTENAME}"
  exit 1
fi

if [ $ADDHEADER -gt 0 ]; then
  # Add header
  HEADERDATE=$(date +"%Y-%m-%dT%T")
  printf "title = ${TITLE}\ndate = ${HEADERDATE}\n" >> ${NOTENAME}
  printf "tags =\npath = ${NOTENAME}\n\n\n" >> ${NOTENAME}
fi

# Edit note
${EDITOR} ${NOTENAME}
