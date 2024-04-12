#!/bin/bash

# Get the directory of the script
script_dir=$(dirname "$0")

# Set the folder where the images are located
images_folder="$script_dir/scraped_images"

# Get the number of images in the folder
num_images=$(ls "$images_folder" | wc -l)

# Rename the images
i=1
for image_file in "$images_folder"/*; do
    if [ -f "$image_file" ]; then
        image_extension="${image_file##*.}"
        new_image_name="$images_folder/image_$i.$image_extension"
        mv "$image_file" "$new_image_name"
        echo "Renamed $image_file to $new_image_name"
        i=$((i + 1))
    fi
done

echo "Renamed $num_images images in the $images_folder folder."