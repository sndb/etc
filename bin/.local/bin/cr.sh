#!/usr/bin/env bash
# compile & run

gcc -std=c11 -pedantic -Wall -Wextra -Werror -O2 "$@" && ./a.out