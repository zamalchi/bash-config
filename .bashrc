# .bashrc

echo "### BASHRC START ###"

PARENT_DIR=$( cd "$(dirname "${BASH_SOURCE}")" ; pwd -P )

# sed this value from setup.sh
INSTALL_DIR=$PARENT_DIR

### Source BAsh rc ###
alias sba=". ${HOME}/.bashrc";
alias bashrc=". ${HOME}/.bashrc";

############################################

# Source global definitions
if [ -f /etc/bashrc ]; then
	echo "sourcing : /etc/bashrc"
	. /etc/bashrc
fi

# Source main config file
if [ -f ${INSTALL_DIR}/config ]; then
	echo "sourcing : ${INSTALL_DIR}/config"
	. ${INSTALL_DIR}/config
fi

# Source local config file
if [ -f ${INSTALL_DIR}/local ]; then
	echo "sourcing : ${INSTALL_DIR}/local"
	. ${INSTALL_DIR}/local
fi

echo "#### BASHRC END ####"

