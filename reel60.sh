#!/bin/bash

if [ -z "$1" ]; then
  echo "Usage: ./reel60.sh <input_video>"
  exit 1
fi

INPUT="$1"
OUTPUT="${INPUT%.*}_reel60.mp4"

ffmpeg -i "$INPUT" \
  -vf "scale=1080:1920:force_original_aspect_ratio=increase,crop=1080:1920,fps=60" \
  -c:v libx264 \
  -profile:v main \
  -level: 4.2
  -preset slow \
  -crf 23 \
  -maxrate 8M -bufsize 16M \
  -pix_fmt yuv420p \
  -color:primaries bt709 \
  -color:trc bt709 \
  -c:a aac -b:a 128k -ar 44100 -ac 2 \
  -movflags +faststart \
  "$OUTPUT"

echo "60fps Reel optimization complete: $OUTPUT"

