#! /bin/bash
src_dir=`realpath $1`
output_path=`realpath $2`
echo $src_dir
echo $output_path

# check if arguments are valid
webps=($(ls $src_dir/*.webp))
count=0
for webp_file in "${webps[@]}"; do
    output_fname=$(printf "%03d" $count)
    ffmpeg -i $webp_file $output_path/$output_fname.png
    count=$((count + 1))
done