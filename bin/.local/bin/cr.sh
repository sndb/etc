#!/bin/sh
# compile and run $@ with sensible options

gcc -lm -std=c17 -pedantic -Wall -Wextra -Werror -O2 "$@" && ./a.out && rm a.out
