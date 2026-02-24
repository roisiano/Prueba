#!/bin/sh

. /etc/profile

ADDON_DIR=$(dirname "$0")/..
BIN="$ADDON_DIR/bin/astra-sm"
CONF="$ADDON_DIR/config/astra.conf"

if [ ! -f "$CONF" ]; then
  echo "# Default config" > "$CONF"
fi

"$BIN" --config "$CONF"
