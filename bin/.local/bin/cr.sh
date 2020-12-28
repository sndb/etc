#!/usr/bin/env bash

gcc -std=c11 -pedantic -Wall -Wextra -Werror -O2 "$@" && ./a.out
