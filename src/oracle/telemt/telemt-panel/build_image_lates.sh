#!/bin/bash

set -euo pipefail

BUILD_DIR="tp_build"

cleanup() {
    if [ -d "$BUILD_DIR" ]; then
        echo "Cleaning up build directory..."
        rm -rf "$BUILD_DIR"
    fi
}
trap cleanup EXIT

echo "Cloning repository..."
git clone --depth 1 https://github.com/amirotin/telemt_panel.git "$BUILD_DIR"

echo "Building Docker image..."
docker build -t telemt_panel:local -f "$BUILD_DIR/Dockerfile" "$BUILD_DIR"

echo "Success! Image telemt_panel:local created."
