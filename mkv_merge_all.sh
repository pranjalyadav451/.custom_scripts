#!/bin/zsh

files=$(find . -type f -name "*.mp4"| sort -V)

while read -r i;
do
    video_list+=("$i")
done <<< $files


printf "Enter the name of the output file (Without extension): "
read output_file

mkvmerge -o "$output_file.mkv" '[' $video_list ']'