#!/bin/zsh

subfolders=$(find . -maxdepth 1 -mindepth 1 -type d | sed -e 's/^\.\///' | sort)
while IFS= read -r folder; do
    cd $folder
    extensions=$(find . -maxdepth 1 -mindepth 1 -type f | sed -e 's/.*\.//' | sort | uniq)
    while IFS= read -r ext; do
        mkdir $ext
        mv *.$ext $ext
    done <<< $extensions
    cd ..
done <<< $subfolders