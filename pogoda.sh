#!/bin/sh
#
# gives weather for the chosen place. Requires dmenu, curl and working notifications. You
# can chose to read list of places from the file or variable. Default is to read places
# from the variable WEATHER. Comment and uncomment appropriate lines in order to change
# behaviour 
# 

WEATHER="London
Berlin
Paris
New_york
Moscow
Warsaw"
#   uncomment line below and comment lines above if you want to use file instead of variable
#WEATHER="$HOME/.config/weather/places.dat"

place=$( echo "${WEATHER:?'WEATHER var is not set!'}" | dmenu -i -l 20 -p "Which place?")
#   uncomment line below and comment line above if you want to use file instead of variable
#place=$( cat "${WEATHER:?'WEATHER var is not set!'}" | dmenu -i -l 20 -p "Which place?")

OUTPUT=$( curl wttr.in/"$place"?format=3 )

notify-send -u low "$OUTPUT"
