#!/bin/bash

# resizes images to fit the presentation better

FILENAME=$1
HEIGHT=600

if [[ $# -lt 1 ]]; then
    echo "usage: $0 infile"
    exit
fi

convert "${FILENAME}" -resize x${HEIGHT} "/tmp/$( basename ${FILENAME})"
cp "${FILENAME}" "/tmp/$( basename ${FILENAME}).bak"
mv "/tmp/$( basename ${FILENAME})" "${FILENAME}"
