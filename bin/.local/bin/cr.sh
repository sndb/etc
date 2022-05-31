#!/bin/sh
# compile $@ with sensible options and run a.out

gcc -std=c11 -pedantic -Wall -Wextra -Werror -O2 "$@" && ./a.out
