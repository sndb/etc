#!/bin/sh
# mail sync

mbsync -c "$XDG_CONFIG_HOME/isync/mbsyncrc" -a
notmuch new
