#!/bin/bash

PARENT_DIR=$( cd "$(dirname "${BASH_SOURCE}")" ; \pwd -P )

INSTALL_DIR=$PARENT_DIR

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

if [ -e ${INSTALL_DIR}/partials/colors ]; then
	. ${INSTALL_DIR}/partials/colors
fi


# DATE="`date +%Y%m%d-%H%M%S`"

# files=(".bashrc" ".bash_config" ".bash_local")

echo -e "\n############################################"

# if .bashrc.off doesn't exists (initial setup), mv .bashrc to .bashrc.off (if it exists)
if [ ! -e ${HOME}/.bashrc.off ]; then

	# if the old and new .bashrc files both exist, rename the old and copy the new
	if [ -e ${HOME}/.bashrc ] && [ -e ${HOME}/.bashrc ]; then
		mv ${HOME}/.bashrc ${HOME}/.bashrc.off
		echo -e "${GREEN}moved : ${HOME}/.bashrc --> ${HOME}/.bashrc.off${NORMAL}"
		cp ${INSTALL_DIR}/.bashrc ${HOME}/.bashrc
		echo -e "${GREEN}copied : ${INSTALL_DIR}/.bashrc --> ${HOME}/.bashrc${NORMAL}"

		# set the INSTALL_DIR variable in the deployed .bashrc
		sed -i "/^INSTALL_DIR/c INSTALL_DIR=${INSTALL_DIR}" ${HOME}/.bashrc
	fi

# if .bashrc.off exists, just overwrite .bashrc
# (the assumption is that this isn't the initial setup and that .bashrc.off is the original)
elif [ -e ${HOME}/.bashrc.off ]; then
	cp ${INSTALL_DIR}/.bashrc ${HOME}/.bashrc
	echo -e "${CYAN}updated : ${INSTALL_DIR}/.bashrc --> ${HOME}/.bashrc${NORMAL}"

	# set the INSTALL_DIR variable in the deployed .bashrc
	sed -i "/^INSTALL_DIR/c INSTALL_DIR=${INSTALL_DIR}" ${HOME}/.bashrc
fi

echo -e "############################################\n"

# if 
	# msg="${INSTALL_DIR}/.bashrc --> ${INSTALL_DIR}/.bashrc.off"

# 	mv ${INSTALL_DIR}/.bashrc ${INSTALL_DIR}/.bashrc.off 2> /dev/null;
# 	if [ $? -eq 0 ]; then
# 		echo -e "${CYAN}moved: ${msg}${NORMAL}"
# 	else
# 		echo -e "${RED}did not move: ${msg}${NORMAL}"
# 	fi
# fi


# for f in "${files[@]}"; do

# 	###### move files to backup if they exist

# 	if [ -e ${INSTALL_DIR}/${f} ]; then
# 		msg="${INSTALL_DIR}/${f} --> ${PARENT_DIR}/backup/${f}.${DATE}"

# 		mv ${INSTALL_DIR}/${f} ${PARENT_DIR}/backup/${f}.${DATE} 2> /dev/null;
# 		if [ $? -eq 0 ]; then
# 			echo -e "${CYAN}moved: ${msg}${NORMAL}"
# 		else
# 			echo -e "${RED}did not move: ${msg}${NORMAL}"
# 		fi
# 	fi

# 	###### copy new files into install dir

# 	msg="${PARENT_DIR}/${f} --> ${INSTALL_DIR}/${f}"

# 	cp ${PARENT_DIR}/${f} ${INSTALL_DIR}/${f} 2> /dev/null;
# 	if [ $? -eq 0 ]; then
# 		echo -e "${GREEN}copied: ${msg}${NORMAL}"
# 	else
# 		echo -e "${RED}did not copy: ${msg}${NORMAL}"
# 	fi

# done



#source ${HOME}/.bashrc;
