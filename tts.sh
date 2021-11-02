#!/bin/bash

export WINEARCH=win32
export WINEPREFIX=$HOME/.wine32


if [ $# -ge 1 ] && [ $1 = "--xclip" ]; then
    text="$(xclip -o)"
else
    text="${@:-$(</dev/stdin)}"
fi

text=$(sed -e "s/’/'/g" -e 's/“”[‘”“–•—‘‑]￼￼/ /g' <<< "$text")

echo "$text" | wine 'C:\balcon\balcon.exe' -i -n 'Microsoft Server Speech Text to Speech Voice (en-US, ZiraPro)' -s 7 &> /dev/null
