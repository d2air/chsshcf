#!/bin/bash
#  change_ssh_config.sh
#  
#  Copyright 2017 David Air <david@d2air.com>
#  
#  This program is free software; you can redistribute it and/or modify
#  it under the terms of the GNU General Public License as published by
#  the Free Software Foundation; either version 2 of the License, or
#  (at your option) any later version.
#  
#  This program is distributed in the hope that it will be useful,
#  but WITHOUT ANY WARRANTY; without even the implied warranty of
#  MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
#  GNU General Public License for more details.
#  
#  You should have received a copy of the GNU General Public License
#  along with this program; if not, write to the Free Software
#  Foundation, Inc., 51 Franklin Street, Fifth Floor, Boston,
#  MA 02110-1301, USA.
#  
# 
# vérifier utilisateur ou droit root avec id -u = 0
if [ "`id -u`" -eq 0 ]; then
	#Jusqu'a ce que la reponse soit composée par un nombre entre 0 et 4, j'attends la saisie
	until [[ ${nombre} =~ ^[0-4]+$ ]]; do
		echo -e "Choose configuration :\n\t0 = Exit\n\t1 = Permissive (password yes)\n\t2 = Permissive (password no)\n\t3 = Secured (password yes)\n\t4 = Secured (password no)"
		read nombre
	done
	case $nombre in
		0)
			echo "Bye bye"
			exit 0
			;;
		1)
			rm /etc/ssh/ssh_config
			cp /etc/ssh/ssh_config.permissivefull /etc/ssh/ssh_config
			echo "The ssh_config file is replaced with the template ssh_config.permissivefull"
			exit 0
			;;
		2)
			rm /etc/ssh/ssh_config
			cp /etc/ssh/ssh_config.permissive /etc/ssh/ssh_config
			echo "The ssh_config file is replaced with the template ssh_config.permissive"
			exit 0
			;;
		3)
			rm /etc/ssh/ssh_config
			cp /etc/ssh/ssh_config.lessrestricted /etc/ssh/ssh_config
			echo "The ssh_config file is replaced with the template ssh_config.lessrestricted"
			exit 0
			;;
		4)
			rm /etc/ssh/ssh_config
			cp /etc/ssh/ssh_config.restricted /etc/ssh/ssh_config
			echo "The ssh_config file is replaced with the template ssh_config.restricted"
			exit 0
			;;
	esac
else
	echo "This script must be run as root" 1>&2
	exit 1
fi

exit 0

