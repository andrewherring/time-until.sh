#!/bin/bash

wdth=350

# use zenity forms dialog to determine a future date and time ($fdt)
fdt=$(zenity --forms --title="Your input is important to us"\
	--width=$wdth\
	--text="please select a time and date"\
	--add-entry="time"\
	--add-calendar="date"\
	--separator=" ")

# compute the number of seconds per year, day, hour, minute, respectively
secperyear=$(( $(date +%s --date="01/01/2022")-$(date +%s --date="01/01/2021") ))
secperday=$(( $secperyear/365 ))
secperhour=$(( $secperday/24 ))
secpermin=$(( $secperhour/60 ))

# the difference in seconds between $fdt and now
secdiff=$(( $(date +%s --date="$fdt")-$(date +%s) ))

years=0
while [ $secdiff -ge $secperyear ]; do
	years=$(( $years + 1 ))
	secdiff=$(( $secdiff-$secperyear ))
done

days=0
while [ $secdiff -ge $secperday ]; do
	days=$(( $days + 1 ))
	secdiff=$(( $secdiff-$secperday ))
done

hours=0
while [ $secdiff -ge $secperhour ]; do
	hours=$(( $hours +1 ))
	secdiff=$(( $secdiff-$secperhour ))
done

minutes=0
while [ $secdiff -ge $secpermin ]; do
	minutes=$(( $minutes +1 ))
	secdiff=$(( $secdiff-$secpermin ))
done

zenity --width=150 --title="$fdt is in" --info\
	--text="$(echo "$years year(s),\n $days day(s),\n $hours hour(s),\n and $minutes minute(s).")"\
	--ok-label="thank you"
