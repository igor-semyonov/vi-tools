#!/bin/bash

import -silent /tmp/ss.tif 

tesseract /tmp/ss.tif /tmp/ss-out -l eng

export WINEARCH=win32
export WINEPREFIX=$HOME/.wine32
cat /tmp/ss-out.txt | sed \
 		-e "s/’/'/g"			\
 		-e 's/[”“–•—‘‑…]/ /g'  |	\
        wine 'C:\balcon\balcon.exe' -i -n 'Microsoft Server Speech Text to Speech Voice (en-US, ZiraPro)' -s 7 &> /dev/null
