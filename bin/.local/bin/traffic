#!/bin/sh
# log traffic data

logfile="$XDG_RUNTIME_DIR/traffic"

read -r rxprevious txprevious <"$logfile"
rxcurrent="$(($(paste -d + /sys/class/net/*[!lo]/statistics/rx_bytes)))"
txcurrent="$(($(paste -d + /sys/class/net/*[!lo]/statistics/tx_bytes)))"

echo $((rxcurrent - rxprevious)) $((txcurrent - txprevious))
echo "$rxcurrent $txcurrent" >"$logfile"
