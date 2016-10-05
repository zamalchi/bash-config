# .bashrc

PARENT_DIR=$( cd "$(dirname "${BASH_SOURCE}")" ; pwd -P )

# sed this value from setup.sh
INSTALL_DIR=$PARENT_DIR

### Source BAsh rc ###
VERBOSE_FLAG=0
function sba () {
  while getopts ":v" opt; do
    case $opt in
      v)
        echo "setting flag to 1"
        VERBOSE_FLAG=1
        ;;
    esac
  done

  . ${HOME}/.bashrc
}
alias bashrc="sba";

############################################

if [ "$VERBOSE_FLAG" -eq 1 ]; then
  echo "### BASHRC START ################################"
fi

# Source global definitions
if [ -f /etc/bashrc ]; then
  if [ "$VERBOSE_FLAG" -eq 1 ]; then
    echo "sourcing : /etc/bashrc"
  fi
  . /etc/bashrc
fi

#if [ -f /usr/local/bin/virtualenvwrapper.sh ]; then
#	. /usr/local/bin/virtualenvwrapper.sh
#fi

# Source main config file
if [ -f ${INSTALL_DIR}/config ]; then
  if [ "$VERBOSE_FLAG" -eq 1 ]; then
    echo "sourcing : ${INSTALL_DIR}/config"
  fi
  . ${INSTALL_DIR}/config "${VERBOSE_FLAG}"
fi

# Source local config file
if [ -f ${INSTALL_DIR}/local ]; then
  if [ "$VERBOSE_FLAG" -eq 1 ]; then
    echo "sourcing : ${INSTALL_DIR}/local"
  fi
  . ${INSTALL_DIR}/local
fi

if [ "$VERBOSE_FLAG" -eq 1 ]; then
  echo "#### BASHRC END #################################"
fi
