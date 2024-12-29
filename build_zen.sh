#!/bin/bash

set -e

rm -rf .west

west init -l config_zen && west update
export "CMAKE_PREFIX_PATH=/keymap/zephyr:$CMAKE_PREFIX_PATH"

west build -d /build/left -p -b "corneish_zen_v2_left" \
  -s /keymap/zmk/app \
  -- -DZMK_CONFIG="/keymap/config_zen"

west build -d /build/right -p -b "corneish_zen_v2_right" \
  -s /keymap/zmk/app \
  -- -DZMK_CONFIG="/keymap/config_zen"

mkdir -p /keymap/firmware
cp /build/left/zephyr/zmk.uf2 /keymap/firmware/corneish_zen_v2_left.uf2
cp /build/right/zephyr/zmk.uf2 /keymap/firmware/corneish_zen_v2_right.uf2