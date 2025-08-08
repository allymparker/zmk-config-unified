#!/bin/bash

set -e

echo "Building for Charma keyboard with dongle"
KEYBOARD_NAME="charma"
BOARD_NAME="seeeduino_xiao_ble"
DONGLE_BOARD="nice_nano_v2"
ADDITIONAL_SHIELDS="rgbled_adapter"

rm -rf .west

west init -l config_$KEYBOARD_NAME && west update
export "CMAKE_PREFIX_PATH=/keymap/zephyr:$CMAKE_PREFIX_PATH"

# Build dongle (central)
west build -d /build/dongle -p -b "$DONGLE_BOARD" \
  -s /keymap/zmk/app \
  -- -DSHIELD="${KEYBOARD_NAME}_dongle" \
  -DZMK_CONFIG="/keymap/config_$KEYBOARD_NAME"

# Build left peripheral
west build -d /build/left -p -b "$BOARD_NAME" \
  -s /keymap/zmk/app \
  -- -DSHIELD="${KEYBOARD_NAME}_left ${ADDITIONAL_SHIELDS}" \
  -DZMK_CONFIG="/keymap/config_$KEYBOARD_NAME" \
  -DCONFIG_ZMK_SPLIT=y \
  -DCONFIG_ZMK_SPLIT_ROLE_CENTRAL=n

# Build right peripheral
west build -d /build/right -p -b "$BOARD_NAME" \
  -s /keymap/zmk/app \
  -- -DSHIELD="${KEYBOARD_NAME}_right ${ADDITIONAL_SHIELDS}" \
  -DZMK_CONFIG="/keymap/config_$KEYBOARD_NAME" \
  -DCONFIG_ZMK_SPLIT=y \
  -DCONFIG_ZMK_SPLIT_ROLE_CENTRAL=n

# Build settings reset for all boards
west build -d /build/settings_reset_xiao -p -b "$BOARD_NAME" \
  -s /keymap/zmk/app \
  -- -DSHIELD="settings_reset" \
  -DZMK_CONFIG="/keymap/config_$KEYBOARD_NAME"

west build -d /build/settings_reset_dongle -p -b "$DONGLE_BOARD" \
  -s /keymap/zmk/app \
  -- -DSHIELD="settings_reset" \
  -DZMK_CONFIG="/keymap/config_$KEYBOARD_NAME"

mkdir -p /keymap/firmware
cp /build/dongle/zephyr/zmk.uf2 /keymap/firmware/${KEYBOARD_NAME}_dongle.uf2
cp /build/left/zephyr/zmk.uf2 /keymap/firmware/${KEYBOARD_NAME}_left_peripheral.uf2
cp /build/right/zephyr/zmk.uf2 /keymap/firmware/${KEYBOARD_NAME}_right_peripheral.uf2
cp /build/settings_reset_xiao/zephyr/zmk.uf2 /keymap/firmware/${KEYBOARD_NAME}_settings_reset.uf2
cp /build/settings_reset_dongle/zephyr/zmk.uf2 /keymap/firmware/${KEYBOARD_NAME}_dongle_settings_reset.uf2
