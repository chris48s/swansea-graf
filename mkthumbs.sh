#!/usr/bin/env bash

set -euo pipefail

SRC_ROOT="images"
DST_ROOT="thumbnails"

# Get subdirectories under images/
mapfile -t DIRS < <(find "$SRC_ROOT" -mindepth 1 -maxdepth 1 -type d -printf "%f\n")

# Clear the thumbnails directory
rm -rf "$DST_ROOT"
mkdir -p "$DST_ROOT"

# Process each subdirectory
for d in "${DIRS[@]}"; do
    mkdir -p "$DST_ROOT/$d"
    mogrify -path "$DST_ROOT/$d" -thumbnail 700x700 "$SRC_ROOT/$d"/*.jpg
done
