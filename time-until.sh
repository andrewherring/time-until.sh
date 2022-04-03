#!/bin/bash

# this is a very basic gui application (using zenity: https://help.gnome.org/users/zenity/stable/)
#  for computing the time between now and some future time and date ($fdt)

# use zenity forms dialog to determine a future date and time ($fdt)
fdt=$(zenity --forms --title="Time Until"\
	--width=350\
	--text="please select a time and date"\
	--add-entry="time"\
	--add-calendar="date"\
	--separator=" ")

# the difference in seconds between $fdt and now
secdiff=$(( $(date +%s --date="$fdt")-$(date +%s) ))

# compute the number of seconds per year, day, hour, minute, respectively
secperyear=$(( $(date +%s --date="01/01/2022")-$(date +%s --date="01/01/2021") ))
secperday=$(( $secperyear/365 ))
secperhour=$(( $secperday/24 ))
secpermin=$(( $secperhour/60 ))

# set $years (counter) to 0
years=0
while [ $secdiff -ge $secperyear ]; do

	# incremenet $years by 1
	years=$(( $years + 1 ))

	# decrement $secdiff by 1 year (in seconds)
	secdiff=$(( $secdiff-$secperyear ))
done

# set $days (counter) to 0
days=0
while [ $secdiff -ge $secperday ]; do

	# increment $days by 1
	days=$(( $days + 1 ))

	# decrement $secdiff by 1 day (in seconds)
	secdiff=$(( $secdiff-$secperday ))
done

# set $hours (counter) to 0
hours=0
while [ $secdiff -ge $secperhour ]; do

	# increment $hours by 1
	hours=$(( $hours +1 ))

	# decrement $secdiff by 1 hour (in seconds)
	secdiff=$(( $secdiff-$secperhour ))
done

# set $minutes (counter) to 0
minutes=0
while [ $secdiff -ge $secpermin ]; do

	# increment $minutes by 1
	minutes=$(( $minutes +1 ))

	# decrement $secdiff by 1 min (in seconds)
	secdiff=$(( $secdiff-$secpermin ))
done

# the time between now and $fdt is therefore:
#		$years years	
#		$days days
#		$hours hours
#		and $minutes minutes;
# present this information in a zenity --info dialog 
zenity --width=200 --title="Time Until" --info\
	--text="<span size='large' weight='bold'>$fdt</span> is:\ 
		<span size='xx-large' weight='bold' color='#005766'>$years</span> year(s),\

		<span size='xx-large' weight='bold' color='#008299'>$days</span> day(s),\

		<span size='xx-large' weight='bold' color='#00ccf1'>$hours</span> hour(s), and\

		<span size='xx-large' weight='bold' color='#80ecff'>$minutes</span> minute(s)\

from now"\
	--ok-label="thank you"
