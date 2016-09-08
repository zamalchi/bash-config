# .bashrc

# Source global definitions
if [ -f /etc/bashrc ]; then
	. /etc/bashrc
fi

# Source main config file
if [ -f ~/.bash_config ]; then
	. ~/.bash_config
fi

# Source local config file
if [ -f ~/.bash_local ]; then
	. ~/.bash_local
fi
