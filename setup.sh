#!/bin/bash

parent_path=$( cd "$(dirname "${BASH_SOURCE}")" ; pwd -P )

# .bash_config
if [ -e ${HOME}/.bash_config ]; then
    mv ${HOME}/.bash_config{,.off};
fi
cp ${parent_path}/.bash_config ${HOME}/.bash_config;

# .bashrc
if [ -e ${HOME}/.bashrc ]; then
    mv ${HOME}/.bashrc{,.off};
fi
cp ${parent_path}/.bashrc ${HOME}/.bashrc;


. ${HOME}/.bashrc;