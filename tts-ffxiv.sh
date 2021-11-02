#!/bin/bash

import -window root -silent /tmp/ss-cropped.tif -crop 1320x320+300+760
#convert /tmp/ss.tif -crop 1320x320+300+760 /tmp/ss-cropped.tif

tesseract /tmp/ss-cropped.tif /tmp/ss-out -l eng

export WINEARCH=win32
export WINEPREFIX=/home/kdcadet/.wine32
cat /tmp/ss-out.txt | sed \
 		-e "s/’/'/g"			\
 		-e 's/[”“–•—‘‑…]/ /g'  |	\
        wine 'C:\balcon\balcon.exe' -i -n 'Microsoft Server Speech Text to Speech Voice (en-US, ZiraPro)' -s 7 &> /dev/null
