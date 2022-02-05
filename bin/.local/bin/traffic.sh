#!/bin/sh

LOGFILE="${HOME}/.cache/netlog"
read -r RXPREVIOUS TXPREVIOUS <"$LOGFILE"
RXCURRENT="$(($(paste -d + /sys/class/net/*[!lo]/statistics/rx_bytes)))"
TXCURRENT="$(($(paste -d + /sys/class/net/*[!lo]/statistics/tx_bytes)))"

echo $((RXCURRENT - RXPREVIOUS)) $((TXCURRENT - TXPREVIOUS))
echo "$RXCURRENT $TXCURRENT" >"$LOGFILE"
