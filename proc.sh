#!/bin/zsh

folders=$(find . -maxdepth 1 -mindepth 1 -type d -print0| sed 's/^\.\///')

while read -d '' -r folder; do
	echo "Moving to $folder."
	cd "$folder"
	file_types=$(find . -maxdepth 1 -mindepth 1 -type f | sed 's/.*\.//' | sort | uniq)
	while read -r file_type; do
		echo "$file_type."
		mkdir $file_type
		mv *.$file_type "$file_type"
	done <<< $file_types
	echo "Moving out of $folder.\n"
	cd ..
done <<< $folders
