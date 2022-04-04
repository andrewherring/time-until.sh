
## `time-until.sh`

By Andrew W. Herring

---

A simple bash script for computing the number of years, days, hours, and minutes between now and some future date and time. Collection of user input and presentation of results are handled by [zenity](https://help.gnome.org/users/zenity/stable/) GUI's.

### Description

On execution, a zenity [calendar](https://help.gnome.org/users/zenity/stable/calendar.html.en) dialog prompts the user to select some future date and time (`$fdt`), and then a zenity [info](https://help.gnome.org/users/zenity/stable/info.html.en) dialog reports the number of years, days, hours, and minutes between the time of execution and `$fdt`:
<p style="text-align:center">
	<img alt="demonstrating time-until.sh with time given in 12hr format" src="./img/time-until-1.gif" width="300"/>
</p>

At the initial prompt, `time` values in both 12hr and 24hr formats are accepted:

<p style="text-align:center">
	<img alt="demonstrating time-until.sh with time given in 24hr format" src="./img/time-until-2.gif" width="300"/>
</p>

### Dependencies
* bash
* [zenity](https://help.gnome.org/users/zenity/)

### Usage



