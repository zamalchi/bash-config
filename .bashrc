# .bashrc

PARENT_DIR=$( cd "$(dirname "${BASH_SOURCE}")" ; pwd -P )

# sed this value from setup.sh
INSTALL_DIR=$PARENT_DIR

### Source BAsh rc ###
alias sba=". ${PARENT_DIR}/.bashrc";
alias bashrc=". ${PARENT_DIR}/.bashrc";

############################################

# Source global definitions
if [ -f /etc/bashrc ]; then
	. /etc/bashrc
fi

# Source main config file
if [ -f ${INSTALL_DIR}/bash-config/config ]; then
	. ${INSTALL_DIR}/bash-config/config
fi

# Source local config file
if [ -f ${INSTALL_DIR}/bash-config/local ]; then
	. ${INSTALL_DIR}/bash-config/local
fi

