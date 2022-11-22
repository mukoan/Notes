#!/bin/bash
# File   : note.sh
# Date   : 2022.10.14
# Author : Lyndon Hill
# Brief  : Make a note

# Get note name or default to "note"
TITLE="note"
if [ $# -gt 0 ]; then
  TITLE="$1"
fi

NOTENAME="${HOME}/Documents/Notes/${TITLE}$(date +"%Y%m%d")"

if test -f "$NOTENAME"; then
  echo "File $NOTENAME already exists"
  exit 1
fi

# Set your favourite text editor here
gvim ${NOTENAME}
