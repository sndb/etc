#!/bin/sh -eu
# find and read a book

books_dir="$HOME/books"
book="$(find "$books_dir" -type f | dmenu -i -l 20)"

zathura "$book"
