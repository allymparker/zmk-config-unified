#!/bin/bash

set -e

if [ -z "$1" ] || [ -z "$2" ]; then
  echo "Usage: $0 <keyboard_name> <board_name>"
  exit 1
fi

KEYBOARD_NAME=$1
BOARD_NAME=$2

rm -rf .west

west init -l config_$KEYBOARD_NAME && west update
export "CMAKE_PREFIX_PATH=/keymap/zephyr:$CMAKE_PREFIX_PATH"

west build -d /build/left -p -b "$BOARD_NAME" \
  -s /keymap/zmk/app \
  -- -DSHIELD="${KEYBOARD_NAME}_left" \
  -DZMK_CONFIG="/keymap/config_$KEYBOARD_NAME"

west build -d /build/right -p -b "$BOARD_NAME" \
  -s /keymap/zmk/app \
  -- -DSHIELD="${KEYBOARD_NAME}_right" \
  -DZMK_CONFIG="/keymap/config_$KEYBOARD_NAME"

west build -d /build/settings_reset -p -b "$BOARD_NAME" \
  -s /keymap/zmk/app \
  -- -DSHIELD="settings_reset" \
  -DZMK_CONFIG="/keymap/config_$KEYBOARD_NAME"

mkdir -p /keymap/firmware
cp /build/left/zephyr/zmk.uf2 /keymap/firmware/${KEYBOARD_NAME}_left.uf2
cp /build/right/zephyr/zmk.uf2 /keymap/firmware/${KEYBOARD_NAME}_right.uf2
cp /build/settings_reset/zephyr/zmk.uf2 /keymap/firmware/${KEYBOARD_NAME}_settings_reset.uf2