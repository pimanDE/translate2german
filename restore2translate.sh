#!/bin/bash
#
# Mit diesem Script wird durch eine auszuwählende Sicherung die Übersetzung durch translate2german.sh zurückgespielt
# Vielen Dank an BigBen2003 https://github.com/BigBen2003
#
# Benutzung auf eigene Gefahr!!!
#
####################################################################################################################
# Setzen der Variablen

username=`whoami`
hostname=`hostname`
ipadresse=`hostname -I`
date=`date +'%Y%m%d-%H%M%S'`

standard="\033[0m"
grau="\033[1;30m"
rotfett="\033[1;31m"
blaufett="\033[1;34m"
gruenfett="\033[1;32m"

info="[i]"
over="\\r\\033[K"
fehler="[${rotfett}✗${standard}]"
haken="[${gruenfett}✓${standard}]"
done="${gruenfett} done!${standard}"

touch /tmp/error-translate.log
exec 2> /tmp/error-translate.log

####################################################################################################################
# Start des Script's

clear

standard="\033[0m"
rotfett="\033[1;31m"
blaufett="\033[1;34m"
gruenfett="\033[1;32m"

clear

echo
echo
echo -e "${blaufett}Wiederherstellen der Sicherung vor der Übersetzung durch translate2german.sh ...${standard}"
echo

path=/opt/pihole/

files=$(find "$path" | grep  -oPe '\.vom\.\K[0-9][0-9][0-9][0-9][0-9][0-9][0-9][0-9]\-[0-9][0-9][0-9][0-9][0-9][0-9]$' | sort)

declare -i nr=1

if [ ${#files} -eq 0 ]; then
	echo -e "${blaufett}Es sind keine Sicherungen vorhanden!${standard}"
	echo
	exit
fi

echo -e "${blaufett}Folgende Sicherungen sind vorhanden:${standard}"
echo

echo -e "${gruenfett}0 > ABBRUCH!${standard}"
for file in $files
do
	echo -e "${gruenfett}$nr > $file${standard}"
	nr+=1
done
	echo
	echo -e "${blaufett}Bitte die entsprechende Zahl eingeben!${standard}"
	echo
read input
	if [[ $input ]] && [ $input -eq 0 2>/dev/null ]
	then
		echo
		echo -e "${rotfett}Abbruch!${standard}"
		echo
		exit
	fi
	if [[ $input ]] && [ $input -eq $input 2>/dev/null ] && [ $input -lt $nr  2>/dev/null ] && [ $input -gt 0 2>/dev/null ]
	then

# Auswahl der Datei

		declare -i nr=0
		for file in $files
		do
		        nr+=1
			if [ $nr -eq $input ]; then
				echo
				echo -e "${blaufett}Stelle die Pi-hole Dateien und das Verzeichnis (vom) $file wieder her ...${standard}"

				echo
				sudo rm -r /var/www/html/
				sudo mv /var/www/html.sicherung.vom.$file /var/www/html/

				sudo rm /opt/pihole/gravity.sh
				sudo mv /opt/pihole/gravity.sh.sicherung.vom.$file /opt/pihole/gravity.sh

				sudo rm -r /usr/local/bin/pihole
				sudo mv /usr/local/bin/pihole.sicherung.vom.$file /usr/local/bin/pihole

				echo -e "${blaufett}Erledigt!${standard}"
				echo
				exit;
			fi
		done

	else
		echo
		echo -e "${rotfett}$input Diese Sicherung ist nicht vorhanden!${standard}"
		echo
		exit;
	fi
