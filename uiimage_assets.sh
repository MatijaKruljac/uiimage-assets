#!/bin/bash

read -p "Enter file directory path: " file_path
read -p "Enter file name: " file_name
read -p "Enter full Assets directory path: " assets_directory_path

if [ ! -d $file_path ]; then
	echo "$file_path is not correct path!"
	exit 1
fi

if [ ! -d $assets_directory_path ]; then
	echo "$assets_directory_path is not correct path!"
	exit 1
fi

filename="$file_path/$file_name"
if [ ! -f $file_path ]; then
    touch $filename
fi

assets=()

function pickup_image_assets() 
{
	initial_path=$1
	for entry in "$initial_path"/*
	do  
		if [[ -d $entry && 
			$entry != *.imageset && 
			$entry != *.appiconset && 
			$entry != *.colorset && 
			$entry != *.launchimage ]]; then
			directory_name="$(basename $entry)"
			new_path="$initial_path/$directory_name"
			pickup_image_assets "$new_path"
		elif [[ $entry == *.imageset ]]; then
			last_part_of_entry_path=${entry##*/}
			IFS="." read -a asset <<< "$last_part_of_entry_path"
			assets+=($asset)
		fi
	done
}

function add_content_to_file() 
{
	echo "" > $filename
	echo -e "
import Foundation
import UIKit

extension UIImage {" >> $filename
for asset in "${assets[@]}"
do
if [[ $asset != "AppIcon" && $asset != "Contents" ]]; then
	echo -e "
	static var ${asset}: UIImage? {
		return UIImage(named: \"${asset}\")
	}" >> $filename
fi
done
echo -e "}" >> $filename
}

pickup_image_assets "$assets_directory_path"
add_content_to_file
cat $filename