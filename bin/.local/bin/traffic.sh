#!/usr/bin/env bash

logfile="${HOME}/.cache/netlog"
read -r rxprev txprev <"$logfile"

rxcurrent="$(($(paste -d + /sys/class/net/*[!lo]/statistics/rx_bytes)))"
txcurrent="$(($(paste -d + /sys/class/net/*[!lo]/statistics/tx_bytes)))"

echo $((rxcurrent - rxprev)) $((txcurrent - txprev))

echo "$rxcurrent $txcurrent" >"$logfile"
