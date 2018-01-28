#!/bin/bash
#  install.sh
#
# vérifier utilisateur ou droit root avec id -u = 0
if [ "`id -u`" -eq 0 ]; then
	if [ -f "/usr/local/sbin/chsshcf" ]; then
		rm /usr/local/sbin/chsshcf
		echo -e "### REMOVE chsshcf OLD VERSION ###\n"
	fi
	cp chsshcf.sh /usr/local/sbin/chsshcf
	echo -e "### INSTALL chsshcf ###\n"
	chmod 744 /usr/local/sbin/chsshcf
	echo -e "### chmod 744 chsshcf ###\n"
	if [ -f "/etc/ssh/ssh_config.fullpermissive" ]; then
		rm /etc/ssh/ssh_config.fullpermissive
		echo -e "### REMOVE ssh_config.fullpermissive OLD VERSION ###\n"
	fi
	cp conf/ssh_config.fullpermissive /etc/ssh/
	echo -e "### INSTALL ssh_config.fullpermissive ###\n"
	if [ -f "/etc/ssh/ssh_config.permissive" ]; then
		rm /etc/ssh/ssh_config.permissive
		echo -e "### REMOVE cssh_config.permissive OLD VERSION ###\n"
	fi
	cp conf/ssh_config.permissive /etc/ssh/
	echo -e "### INSTALL ssh_config.permissive ###\n"
	if [ -f "/etc/ssh/ssh_config.lessrestricted" ]; then
		rm /etc/ssh/ssh_config.lessrestricted
		echo -e "### REMOVE ssh_config.lessrestricted OLD VERSION ###\n"
	fi
	cp conf/ssh_config.lessrestricted /etc/ssh/
	echo -e "### INSTALL ssh_config.lessrestricted ###\n"
	if [ -f "/etc/ssh/ssh_config.restricted" ]; then
		rm /etc/ssh/ssh_config.restricted
		echo -e "### REMOVE ssh_config.restricted OLD VERSION ###\n"
	fi
	cp conf/ssh_config.restricted /etc/ssh/
	echo -e "### INSTALL ssh_config.restricted ###\n"
	echo -e "\033[32;1m### INSTALL COMPLETED ###\033[0m"
else
	echo "This script must be run as root" 1>&2
	exit 1
fi

exit 0
