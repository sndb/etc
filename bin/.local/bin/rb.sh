#!/bin/sh
# find and read a book
set -eu

BOOKS_DIR="$HOME/books"
BOOK="$(find "$BOOKS_DIR" -type f | dmenu -i -l 20)"

zathura "$BOOK"
