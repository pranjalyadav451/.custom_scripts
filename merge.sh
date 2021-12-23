#!/bin/zsh
##### Removing the spaces from the files
# files=$(find . -type f -name "*.mp4" -print0)
# while IFS= read -d '' -r file_name; do
#     echo $file_name
#     mv -v "$file_name" "$(echo "$file_name" | sed 's|'" "'|_|g')"
# done <<< $files

# clearing the mylist file
echo "" > mylist.txt
# echo video_list=$(realpath mylist.txt)

files=$(find . -type f -name "*.mp4"| sort -V)
# echo $files

while read -r i;
do 
    echo "file '$i'" >>mylist.txt;
done <<< $files

printf "Input the name of final video file : "; 
read final_video_file

# echo $final_video_file
# ffmpeg -safe 0 -f concat -i mylist.txt -c copy "$final_video_file.mp4"


# echo "$files"

# ffmpeg -i input.mov -preset slow -codec:a libfdk_aac -b:a 128k -codec:v libx264 -pix_fmt yuv420p -b:v 4500k -minrate 4500k -maxrate 9000k -bufsize 9000k -vf scale=-1:1080 output.mp4

#ffmpeg -i input.mov -preset slow -codec:a libfdk_aac -b:a 128k -codec:v libx264 -pix_fmt yuv420p -b:v 2500k -minrate 1500k -maxrate 4000k -bufsize 5000k -vf scale=-1:720 output.mp4