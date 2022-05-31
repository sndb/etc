#!/bin/sh -eu
# fuzzy find the book under ~/books and open it

books_dir="$HOME/books"
book="$(find "$books_dir" -type f | dmenu -i -l 20)"

$EDITOR "$book"
