
#!/bin/bash

set -e

# Configuration
KEYBOARD_NAME="charma"
PERIPHERAL_BOARD="seeeduino_xiao_ble"
PERIPHERAL_ADDITIONAL_SHIELDS="rgbled_adapter"
DONGLE_BOARD="nice_nano"
DONGLE_ADDITIONAL_SHIELDS="dongle_display"

# Parse command line arguments
BUILD_DONGLE=false
BUILD_PERIPHERALS=false
BUILD_SETTINGS_RESET=false

show_help() {
    echo "Usage: $0 [OPTIONS]"
    echo "Build options for Charma keyboard with dongle"
    echo ""
    echo "Options:"
    echo "  <no args>             Build dongle and peripherals [default]"
    echo "  --all                 Build everything (dongle, peripherals, settings reset)"
    echo "  --dongle              Build just the dongle"
    echo "  --peripherals         Build just the peripherals"
    echo "  --help                Show this help message"
    echo ""
}

# Default to building everything if no arguments provided
if [ $# -eq 0 ]; then
    BUILD_DONGLE=true
    BUILD_PERIPHERALS=true
    BUILD_SETTINGS_RESET=false
fi

# Parse arguments
while [[ $# -gt 0 ]]; do
    case $1 in
        --all)
            BUILD_DONGLE=true
            BUILD_PERIPHERALS=true
            BUILD_SETTINGS_RESET=true
            shift
            ;;
        --dongle)
            BUILD_DONGLE=true
            shift
            ;;
        --peripherals)
            BUILD_PERIPHERALS=true
            shift
            ;;
        --help)
            show_help
            exit 0
            ;;
        *)
            echo "Unknown option: $1"
            show_help
            exit 1
            ;;
    esac
done

# Show what will be built
echo "Building for Charma keyboard with dongle"
echo "Build options:"
echo "  Dongle: $BUILD_DONGLE"
echo "  Peripherals: $BUILD_PERIPHERALS"
echo "  Settings reset: $BUILD_SETTINGS_RESET"
echo ""

rm -rf .west

west init -l config_$KEYBOARD_NAME && west update
export "CMAKE_PREFIX_PATH=/keymap/zephyr:$CMAKE_PREFIX_PATH"

# Build dongle (central)
if [ "$BUILD_DONGLE" = true ]; then
    echo "Building dongle (central)..."
    west build -d /build/charma/dongle -p -b "$DONGLE_BOARD" \
      -s /keymap/zmk/app \
      -- -DSHIELD="${KEYBOARD_NAME}_dongle ${DONGLE_ADDITIONAL_SHIELDS}" \
      -DZMK_CONFIG="/keymap/config_$KEYBOARD_NAME"
fi

# Build peripherals
if [ "$BUILD_PERIPHERALS" = true ]; then
    echo "Building left peripheral..."
    west build -d /build/charma/left_peripheral -p -b "$PERIPHERAL_BOARD" \
      -s /keymap/zmk/app \
      -- -DSHIELD="${KEYBOARD_NAME}_left_peripheral ${PERIPHERAL_ADDITIONAL_SHIELDS}" \
      -DZMK_CONFIG="/keymap/config_$KEYBOARD_NAME" \
      -DCONFIG_ZMK_SPLIT=y \
      -DCONFIG_ZMK_SPLIT_ROLE_CENTRAL=n

    echo "Building right peripheral..."
    west build -d /build/charma/right_peripheral -p -b "$PERIPHERAL_BOARD" \
      -s /keymap/zmk/app \
      -- -DSHIELD="${KEYBOARD_NAME}_right ${PERIPHERAL_ADDITIONAL_SHIELDS}" \
      -DZMK_CONFIG="/keymap/config_$KEYBOARD_NAME" \
      -DCONFIG_ZMK_SPLIT=y \
      -DCONFIG_ZMK_SPLIT_ROLE_CENTRAL=n
fi

# Build settings reset for all boards
if [ "$BUILD_SETTINGS_RESET" = true ]; then
    echo "Building settings reset for peripheral board..."
    west build -d /build/settings_reset_xiao -p -b "$PERIPHERAL_BOARD" \
      -s /keymap/zmk/app \
      -- -DSHIELD="settings_reset" \
      -DZMK_CONFIG="/keymap/config_$KEYBOARD_NAME"

    echo "Building settings reset for dongle board..."
    west build -d /build/settings_reset_dongle -p -b "$DONGLE_BOARD" \
      -s /keymap/zmk/app \
      -- -DSHIELD="settings_reset" \
      -DZMK_CONFIG="/keymap/config_$KEYBOARD_NAME"
fi

mkdir -p /keymap/firmware/charma_dongle

# Copy dongle firmware
if [ "$BUILD_DONGLE" = true ]; then
    echo "Copying dongle firmware..."
    cp /build/charma/dongle/zephyr/zmk.uf2 /keymap/firmware/charma_dongle/${KEYBOARD_NAME}_dongle.uf2
fi

# Copy peripheral firmware
if [ "$BUILD_PERIPHERALS" = true ]; then
    echo "Copying peripheral firmware..."
    cp /build/charma/left_peripheral/zephyr/zmk.uf2 /keymap/firmware/charma_dongle/${KEYBOARD_NAME}_left_peripheral.uf2
    cp /build/charma/right_peripheral/zephyr/zmk.uf2 /keymap/firmware/charma_dongle/${KEYBOARD_NAME}_right_peripheral.uf2
fi

# Copy settings reset firmware
if [ "$BUILD_SETTINGS_RESET" = true ]; then
    echo "Copying settings reset firmware..."
    cp /build/settings_reset_xiao/zephyr/zmk.uf2 /keymap/firmware/charma_dongle/${PERIPHERAL_BOARD}_settings_reset.uf2
    cp /build/settings_reset_dongle/zephyr/zmk.uf2 /keymap/firmware/charma_dongle/${DONGLE_BOARD}_settings_reset.uf2
fi

echo "Build complete!"