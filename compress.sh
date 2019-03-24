#! /bin/bash

i=1
shopt -s nullglob
shopt -s nocaseglob

for file in *.{mp4,wmv,avi,mpeg,mpg,mkv,mov,m4v}; do
		echo ${file};
     	ffmpeg -i "$file" -f ffmetadata "$file"meta.txt
     	ffmpeg -i "$file" -f ffmetadata -i "$file"meta.txt -c:v libx265 -preset medium -x265-params crf=28 -c:a aac -strict experimental -b:a 128k ${file%%.*}.h265.mp4
     	rm "$file"meta.txt
     i=$((i+1))
done