#!/bin/bash

parent_path=$( cd "$(dirname "${BASH_SOURCE}")" ; pwd -P )

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


. ${HOME}/.bashrc;