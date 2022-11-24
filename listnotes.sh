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

RESULTS=()
RESULTS_PARTIAL=()

IFS=$'\n'

for keyword in "$@"
do
  read -r -d '' -a RESULTS_PARTIAL < <( find ${NOTEDIR} | grep .$keyword* && printf '\0' )
  RESULTS=("${RESULTS[@]}" "${RESULTS_PARTIAL[@]}")
  read -r -d '' -a RESULTS_PARTIAL < <( grep -lr "$keyword" ${NOTEDIR}/* && printf '\0' )
  RESULTS=("${RESULTS[@]}" "${RESULTS_PARTIAL[@]}")

  if [[ $(find ${LOGDIR} -type f  | wc -l) -gt 0 ]]; then
    read -r -d '' -a RESULTS_PARTIAL < <( grep -lr "$keyword" ${LOGDIR}/* && printf '\0' )
    RESULTS=("${RESULTS[@]}" "${RESULTS_PARTIAL[@]}")
  fi
done

# Remove duplicates

declare -A NOTE_SEEN
NOTE_UNIQUE=()
for w in "${RESULTS[@]}"; do
    [[ ${NOTE_SEEN[$w]} ]] && continue
    NOTE_UNIQUE+=( "$w" )
    NOTE_SEEN[$w]=x
done

# Output results

for i in "${NOTE_UNIQUE[@]}"; do
  echo $i
done
