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

# # .bash_config
# if [ -e ${HOME}/.bash_config ] && [ ! -e ${HOME}/.bash_config.off ]; then
#     mv ${HOME}/.bash_config{,.off};
#     echo "moved: ~/.bash_config --> ~/.bash_config.off"
# fi
# cp ${PARENT_DIR}/.bash_config ${HOME}/.bash_config;
# echo "copied: bash-config/.bash_control --> ~/.bash_control"

# # .bash_local
# if [ -e ${HOME}/.bash_local ] && [ ! -e ${HOME}/.bash_local.off ]; then
#     mv ${HOME}/.bash_local{,.off};
#     echo "moved: ~/.bash_local --> ~/.bash_local.off"
# fi
# cp ${PARENT_DIR}/.bash_local ${HOME}/.bash_local;
# echo "copied: bash-config/.bash_local --> ~/.bash_local"

# # .bashrc
# if [ -e ${HOME}/.bashrc ] && [ ! -e ${HOME}/.bashrc.off ]; then
#     mv ${HOME}/.bashrc{,.off};
#     echo "moved: ~/.bashrc --> ~/.bashrc.off"
# fi
# cp ${PARENT_DIR}/.bashrc ${HOME}/.bashrc;
# echo "copied: bash-config/.bashrc --> ~/.bashrc"

echo -e "############################################\n"


. ${HOME}/.bashrc;