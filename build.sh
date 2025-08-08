#!/bin/bash

set -e

if [ -z "$1" ]; then
  echo "Usage: $0 <keyboard_name>"
  exit 1
fi

if [ "$1" == "charma" ]; then
  echo "Building for Charma keyboard"
KEYBOARD_NAME="charma"
BOARD_NAME="seeeduino_xiao_ble"
ADDITIONAL_SHIELDS="rgbled_adapter"
fi

if [ "$1" == "corne" ]; then
  echo "Building for Corne keyboard"
KEYBOARD_NAME="corne"
BOARD_NAME="nice_nano_v2"
ADDITIONAL_SHIELDS=""
fi

rm -rf .west

west init -l config_$KEYBOARD_NAME && west update
export "CMAKE_PREFIX_PATH=/keymap/zephyr:$CMAKE_PREFIX_PATH"

west build -d /build/${KEYBOARD_NAME}/left -p -b "$BOARD_NAME" \
  -s /keymap/zmk/app \
  -- -DSHIELD="${KEYBOARD_NAME}_left ${ADDITIONAL_SHIELDS}" \
  -DZMK_CONFIG="/keymap/config_$KEYBOARD_NAME"

west build -d /build/${KEYBOARD_NAME}/right -p -b "$BOARD_NAME" \
  -s /keymap/zmk/app \
  -- -DSHIELD="${KEYBOARD_NAME}_right ${ADDITIONAL_SHIELDS}" \
  -DZMK_CONFIG="/keymap/config_$KEYBOARD_NAME"

west build -d /build/${BOARD_NAME}/settings_reset -p -b "$BOARD_NAME" \
  -s /keymap/zmk/app \
  -- -DSHIELD="settings_reset" \
  -DZMK_CONFIG="/keymap/config_$KEYBOARD_NAME"

mkdir -p /keymap/firmware/${KEYBOARD_NAME}
cp /build/${KEYBOARD_NAME}/left/zephyr/zmk.uf2 /keymap/firmware/${KEYBOARD_NAME}/${KEYBOARD_NAME}_left.uf2
cp /build/${KEYBOARD_NAME}/right/zephyr/zmk.uf2 /keymap/firmware/${KEYBOARD_NAME}/${KEYBOARD_NAME}_right.uf2
cp /build/${BOARD_NAME}/settings_reset/zephyr/zmk.uf2 /keymap/firmware/${KEYBOARD_NAME}/${BOARD_NAME}_settings_reset.uf2