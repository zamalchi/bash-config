#!/bin/bash

parent_path=$( cd "$(dirname "${BASH_SOURCE}")" ; pwd -P )

############################################

while getopts ":rc:" opt; do
	case $opt in
		r)
			echo "-r : install to root (work in progess)"
			;;
		c)
			echo "-c : install to directory : ${OPTARG}" >&2
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

echo -e "\n############################################"

# .bash_config
if [ -e ${HOME}/.bash_config ] && [ ! -e ${HOME}/.bash_config.off ]; then
    mv ${HOME}/.bash_config{,.off};
    echo "moved: ~/.bash_control --> ~/.bash_control.off"
fi
cp ${parent_path}/.bash_config ${HOME}/.bash_config;
echo "copied: bash-config/.bash_control --> ~/.bash_control"

# .bash_local
if [ -e ${HOME}/.bash_local ] && [ ! -e ${HOME}/.bash_local.off ]; then
    mv ${HOME}/.bash_local{,.off};
    echo "moved: ~/.bash_local --> ~/.bash_local.off"
fi
cp ${parent_path}/.bash_local ${HOME}/.bash_local;
echo "copied: bash-config/.bash_local --> ~/.bash_local"

# .bashrc
if [ -e ${HOME}/.bashrc ] && [ ! -e ${HOME}/.bashrc.off ]; then
    mv ${HOME}/.bashrc{,.off};
    echo "moved: ~/.bashrc --> ~/.bashrc.off"
fi
cp ${parent_path}/.bashrc ${HOME}/.bashrc;
echo "copied: bash-config/.bashrc --> ~/.bashrc"

echo -e "############################################\n"


. ${HOME}/.bashrc;