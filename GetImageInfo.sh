#!/bin/bash
# sudo apt install imagemagick-6.q16 (one time only - sudo pwd is unixB...2')
# cd "/mnt/c/Users/bhane/Google Drive/IRM core-econ/testbank"
# Replace all \r\n  with just \n before running any bash files to eliminate carriage return characters
# To run, at the ubuntu command promt, type "./GetImageInfo.sh"
# The first command creates the "listofimages.txt" file that is used as input
ls ./images > listofimages.txt
input="./listofimages.txt"
echo "fname,fext,height,width" > image_info.csv
while IFS= read -r row
do
imagename=$(echo $row)
fname=$(echo $row | cut --delimiter "." --field 1)
fextn=$(echo $row | cut --delimiter "." --field 2)

height=$(identify -format "%h" ./images/$imagename)
width=$(identify -format "%w" ./images/$imagename)

echo "$fname,$fextn,$height,$width" >> image_info.csv
done < "$input"
cat image_info.csv