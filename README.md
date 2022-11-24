# Notes

## Introduction

I like to keep notes in plain text: notes from meetings, calls, documents I am
reading. It's easy to grep your notes.

## Usage

- `note.sh <title>` creates a note using `title` as part of the filename and appends the date
- `listnotes.sh <optional keywords>`  lists your notes, most recent to oldest

## Installation

- Copy the scripts somewhere into your path and make them executable
- By default all notes are kept in `$HOME/Documents/Notes` so make sure that
  directory exists

## Information

- Can I change the date format?
  - No, using YYYYmmdd is the only way to make sure that files are automatically
    listed in chronological order
- If you run `note.sh` without a title, it will use `note` for the title
- If you use multiple keywords with `listnotes.sh` they will be logical OR, i.e. any file
  (name or contents) that contains any of the keywords will be output
- `listnotes.sh` lists notes in order recent to oldest but if more than one keyword is specified then the ordering may not be correct
- Licensed under GPL version 3

## Examples

```
$ note.sh

$ note.sh planning

$ note.sh birthday-present-ideas

$ listnotes.sh

$ listnotes.sh present

$ listnotes.sh present car
```
