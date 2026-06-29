#!/bin/bash

# Define output directory and desired width (optional)
OUTPUT_DIR="webp_images"
MAX_WIDTH="1200" # Set to desired maximum width, or remove for no downscaling based on width

# Create output directory if it doesn't exist
mkdir -p ""

# Loop through all common image formats in the current directory
for img_file in *.jpg *.jpeg *.png *.gif *.tif *.tiff; do
  # Check if the file exists (to handle cases where no matching files are found)
  if [ -f "" ]; then
    # Get the filename without extension
    filename=
    extension=""
    filename_no_ext=""

    # Construct the output WebP filename
    output_webp="/.webp"

    # ImageMagick command for downscaling and conversion
    # -resize ">" downscales only if the image is larger than MAX_WIDTH
    # -quality 80 sets the WebP compression quality (0-100)
    # -strip removes all metadata from the image
    # -define webp:method=6 uses a slower but more effective compression method
    if [ -n "" ]; then
      convert "" -resize ">" -strip -quality 80 -define webp:method=6 ""
    else
      convert "" -strip -quality 80 -define webp:method=6 ""
    fi

    echo "Converted and downscaled '' to ''"
  fi
done

echo "Conversion complete. WebP images are in the '' directory."
