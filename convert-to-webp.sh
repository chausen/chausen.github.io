#!/usr/bin/env bash

set -euo pipefail

ROOT_DIR="assets/images"
MAX_WIDTH="1200"
QUALITY="80"

if command -v magick >/dev/null 2>&1; then
  IM_CMD=(magick)
elif command -v convert >/dev/null 2>&1; then
  IM_CMD=(convert)
else
  echo "Error: ImageMagick not found. Install 'magick' or 'convert'." >&2
  exit 1
fi

if [[ ! -d "$ROOT_DIR" ]]; then
  echo "Error: directory '$ROOT_DIR' not found." >&2
  exit 1
fi

converted=0

while IFS= read -r -d '' img_file; do
  output_webp="${img_file%.*}.webp"

  if [[ -n "$MAX_WIDTH" ]]; then
    "${IM_CMD[@]}" "$img_file" -resize "${MAX_WIDTH}>" -strip -quality "$QUALITY" -define webp:method=6 "$output_webp"
  else
    "${IM_CMD[@]}" "$img_file" -strip -quality "$QUALITY" -define webp:method=6 "$output_webp"
  fi

  converted=$((converted + 1))
  echo "Converted '$img_file' -> '$output_webp'"
done < <(find "$ROOT_DIR" -type f \( -iname '*.jpg' -o -iname '*.jpeg' -o -iname '*.png' -o -iname '*.gif' -o -iname '*.tif' -o -iname '*.tiff' \) -print0)

echo "Conversion complete. Created $converted WebP files under '$ROOT_DIR'."
