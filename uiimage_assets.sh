#!/bin/bash

read -p "Enter project directory path or name: " directory_name
read -p "Enter project path or name: " project_name

while [[ $project_group_decision != "y" || $project_group_decision != "Y" ]]
do
	read -n1 -p "Do you want to save file in project group? (y/n) " project_group_decision
	case $project_group_decision in
		y|Y) break;;
		n|N) break;;
		*) echo; echo "Wrong input!";;
	esac
done

echo ""
if [[ $project_group_decision == "y" || $project_group_decision == "Y" ]]; then
	read -p "Enter path for project group: " group_path
		if [[ $group_path = /* ]]; then
			path="$directory_name/$project_name$group_path"
		else
			path="$directory_name/$project_name/$group_path"
		fi
else
	path="$directory_name/$project_name"
fi

if [ ! -d $path ]; then
	echo "$path is not correct path!"
	exit 1
fi

filename="$path/UIImage+Assets.swift"
if [ ! -f $filename ]; then
    touch $filename
fi

path_to_assets="$directory_name/$project_name/Assets.xcassets"
assets=()
for entry in "$path_to_assets"/*
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