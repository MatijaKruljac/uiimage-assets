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
for entry in "$assets_directory_path"/*
do 
	last_part_of_entry_path=${entry##*/}
	IFS="." read -a asset <<< "$last_part_of_entry_path"
	assets+=($asset)
done

function add_content_to_file() {
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

add_content_to_file
cat $filename