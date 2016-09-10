#!/bin/bash

INSTALL_DIR=${HOME}

############################################

while getopts ":rc:" opt; do
	case $opt in
		r)
			echo "-r : install to root (work in progess)"
			;;
		c)
			echo "-c : install to directory : ${OPTARG}" >&2
			INSTALL_DIR=${OPTARG}
			;;
		\?)
			echo "Invalid option: -${OPTARG}" >&2
			exit 1
			;;
		:)
			echo "Option -${OPTARG} requires an argument" >&2
			exit 1
			;;
	esac
done

############################################

RED=`echo "\033[31m"`
LRED=`echo "\033[1;31m"`
GREEN=`echo "\033[32m"`
LGREEN=`echo "\033[1;32m"`
CYAN=`echo "\033[36m"`
LCYAN=`echo "\033[1;36m"`
NORMAL=`echo "\033[m"`

PARENT_DIR=$( cd "$(dirname "${BASH_SOURCE}")" ; pwd -P )


DATE="`date +%Y%m%d-%H%M%S`"

files=(".bashrc" ".bash_config" ".bash_local")

echo -e "\n############################################"

for f in "${files[@]}"; do

	###### move files to backup if they exist

	if [ -e ${INSTALL_DIR}/${f} ]; then
		msg="${INSTALL_DIR}/${f} --> ${PARENT_DIR}/backup/${f}.${DATE}"

		mv ${INSTALL_DIR}/${f} ${PARENT_DIR}/backup/${f}.${DATE} 2> /dev/null;
		if [ $? -eq 0 ]; then
			echo -e "${CYAN}moved: ${msg}${NORMAL}"
		else
			echo -e "${RED}did not move: ${msg}${NORMAL}"
		fi
	fi

	###### copy new files into install dir

	msg="${PARENT_DIR}/${f} --> ${INSTALL_DIR}/${f}"

	cp ${PARENT_DIR}/${f} ${INSTALL_DIR}/${f} 2> /dev/null;
	if [ $? -eq 0 ]; then
		echo -e "${GREEN}copied: ${msg}${NORMAL}"
	else
		echo -e "${RED}did not copy: ${msg}${NORMAL}"
	fi

done

echo -e "############################################\n"


. ${HOME}/.bashrc;