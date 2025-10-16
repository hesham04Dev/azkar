#!/bin/bash

# Target sample rate (Hz)
TARGET_RATE=22050

# Output folder
OUTPUT_DIR="converted"

mkdir -p "$OUTPUT_DIR"

# Find all mp3 files recursively
find . -type f -iname "*.mp3" | while read -r file; do
  base=$(basename "$file")
  out="$OUTPUT_DIR/$base"

  echo "Converting (mono): $file -> $out"
  ffmpeg -y -i "$file" -ar $TARGET_RATE -ac 1 -b:a 64k "$out"
done

echo "✅ Conversion complete! Files saved in '$OUTPUT_DIR'"
