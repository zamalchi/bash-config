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
files=(".bashrc" ".inputrc")

echo -e "\n############################################"

for f in ${files[@]}; do
	# if file.off doesn't exists (initial setup), mv file to file.off (if it exists)
	if [ ! -e ${HOME}/${f}.off ]; then
	
		# if the file exists, rename it (safe, bc no file is overwritten)
		if [ -e ${HOME}/${f} ]; then
			mv ${HOME}/${f} ${HOME}/${f}.off
			echo -e "${GREEN}moved\t: ${HOME}/${f} --> ${HOME}/${f}.off${NORMAL}"
			cp ${INSTALL_DIR}/${f} ${HOME}/${f}
			echo -e "${GREEN}copied\t: ${INSTALL_DIR}/${f} --> ${HOME}/${f}${NORMAL}"
		fi

	# if file.off exists, just overwrite file
	# (the assumption is that this isn't the initial setup and that file.off is the original)
	elif [ -e ${HOME}/${f} ]; then
		cp ${INSTALL_DIR}/${f} ${HOME}/${f}
		echo -e "${CYAN}updated\t: ${INSTALL_DIR}/${f} --> ${HOME}/${f}${NORMAL}"
	fi
done

# set the INSTALL_DIR variable in the deployed .bashrc
sed -i "/^INSTALL_DIR/c INSTALL_DIR=${INSTALL_DIR}" ${HOME}/.bashrc

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
