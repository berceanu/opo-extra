#!/bin/bash
#$1 = gold.gif

filename=$(basename "$1")
extension="${filename##*.}"
filename="${filename%.*}"

# resize
convert $1 -resize 800x600\>  shrink_${filename}.gif

# invert colors
convert shrink_${filename}.gif -negate output.gif

# convert to webm
ffmpeg -i output.gif -c:v libvpx -crf 12 -b:v 500K ${filename}.webm

# copy to presentation folder
mv ${filename}.webm ~/Development/madrid-talk/videos/

# clean up
rm output.gif shrink_${filename}.gif
