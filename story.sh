#!/bin/bash

# Check if input file is provided
if [ -z "$1" ]; then
  echo "Usage: ./story.sh <input_video>"
  exit 1
fi

INPUT="$1"
# Create output filename by appending _ig to the original name
OUTPUT="${INPUT%.*}_ig.mp4"

# Execute FFmpeg with Instagram-optimized parameters
ffmpeg -i "$INPUT" \
  -vf "scale=1080:1920:force_original_aspect_ratio=increase,crop=1080:1920,fps=30" \
  -c:v libx264 \
  -profile:v high \
  -preset slow \
  -crf 23 \
  -maxrate 5M -bufsize 10M \
  -pix_fmt yuv420p \
  -c:a aac -b:a 128k -ar 44100 -ac 2 \
  "$OUTPUT"

echo "Optimization complete: $OUTPUT"

