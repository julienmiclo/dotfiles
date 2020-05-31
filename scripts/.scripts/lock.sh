#!/bin/bash

ringcolor=FFFFFFFF
insidecolor=00000000
linecolor=00000000
separatorcolor=00000000

ringvercolor=00000000
insidevercolor=00000000

ringwrongcolor=00000000
insidewrongcolor=00000000

keyhlcolor=AAAAAAFF
bshlcolor=AAAAAAFF

i3lock -t -i ~/.wallpapers/lockscreen.jpg \
	--indpos="w/2-r/2:h-r*2" --radius=20 \
	--ringcolor=$ringcolor --insidecolor=$insidecolor --linecolor=$linecolor \
	--separatorcolor=$separatorcolor --ringvercolor=$ringvercolor \
	--insidevercolor=$insidevercolor --veriftext='' --ringwrongcolor=$ringwrongcolor \
	--insidewrongcolor=$insidewrongcolor --wrongtext='' --keyhlcolor=$keyhlcolor \
	--bshlcolor=$bshlcolor --noinputtext=''
