#!/usr/bin/env bash
# find and read a book
set -e

BOOKS_DIR="$HOME/books"

book="$(find "$BOOKS_DIR" -type f | dmenu -i -l 20)"
zathura "$book"
