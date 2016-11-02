#!/bin/bash

# creates a silent, low-fps, low-bitrate .mp4 for use in slide-based presentations

FILENAME=$1
OUTFILE=$2
FPS=5
BPS=192k
# BPS=384k

if [[ $# -lt 2 ]]; then
    echo "usage: $0 infile outfile"
    exit
fi

ffmpeg -i "${FILENAME}" -y -an -vcodec libx264 -b:v ${BPS} -threads 0 -r ${FPS} -pass 1 -f mp4 /dev/null
ffmpeg -i "${FILENAME}" -y -an -vcodec libx264 -b:v ${BPS} -threads 0 -r ${FPS} -pass 2 "${OUTFILE}"

rm -f ffmpeg2pass*
