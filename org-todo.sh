#!/bin/sh

FILE=$1
SEARCH_STRING=$2

echo "Running todo in file $FILE for search string \"$SEARCH_STRING\"..."

emacs "~/Dropbox/org/$FILE" \
      -batch \
      --eval="(progn \
                  (search-forward \"$SEARCH_STRING\") \
                  (org-todo) \
                  (save-buffer))"
