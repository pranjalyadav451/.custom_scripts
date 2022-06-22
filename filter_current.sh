#!/bin/zsh

file_types=$(find . -maxdepth 1 -mindepth 1 -type f | sed 's/.*\.//' | sort | uniq)
while read -r file_type; do
	echo "$file_type."
	mkdir $file_type
	mv *.$file_type "$file_type"
done <<< $file_types