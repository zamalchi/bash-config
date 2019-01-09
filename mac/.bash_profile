
##########################################
# ALIASES

alias vibp="vim ~/.bash_profile"
alias sbp="source ~/.bash_profile"

alias la="ls -AlF" # all
alias lf="ls -laF" # full
alias l.="ls -lFd .*" # hidden
alias l1="ls -1F" # one column
alias l="ls -CF" # short

alias lag="ls -la | grep"

alias ..="cd .."
alias ...="cd ../.."

alias mkdir="mkdir -pv"


alias gits="git status"
alias gitl="git log"

##########################################

export CLICOLOR=1
export LSCOLORS=Exfxcxdxbxegedabagacad
export GREP_OPTIONS='--color=auto'

##########################################
#PS1 COLORS
PS1_RED="\[\033[31m\]"
PS1_GREEN="\[\033[32m\]"
PS1_PURPLE="\[\033[35m\]"
PS1_CYAN="\[\033[36m\]"
PS1_NORMAL="\[\033[0m\]"

#PS1 TIME
PS1_TIME="[${PS1_PURPLE}\t${PS1_NORMAL}]"

# PS1 CUSTOM WORKING DIRECTORY (\w)
PS1_DIR="${PS1_CYAN}\w${PS1_NORMAL}"
#cd ..
#PS1_DIR="${PS1_GREEN}$PWD${PS1_NORMAL}"
#cd - > /dev/null
#PS1_DIR=${PS1_DIR}"/${PS1_CYAN}`echo ${PWD} | awk -F "/" '{print $NF}'`${PS1_NORMAL}"

PS1_END="\n|______ ${PS1_GREEN}\$${PS1_NORMAL} "
SUDO_PS1_END="\n|______ ${PS1_RED}#${PS1_NORMAL} "

# PS1
export PS1="${PS1_TIME} ${PS1_DIR}${PS1_END}";
export SUDO_PS1="${PS1_TIME}[${PS1_RED}root${PS1_NORMAL}] ${PS1_DIR}${SUDO_PS1_END}";

unset PS1_TIME PS1_DIR PS1_END SUDO_PS1_END
##########################################

function pingg-func() {
  ping -c1 www.google.com;
  if [ $? -eq 0 ]; then
    echo -e "\033[32m---------- SUCCESS ----------\033[0m";
  else
    echo -e "\033[31m---------- FAILURE ----------\033[0m";
  fi
}
alias pingg="pingg-func"

##########################################

# Setting PATH for Python 3.7
# The original version is saved in .bash_profile.pysave
PATH="/Library/Frameworks/Python.framework/Versions/3.7/bin:${PATH}"
export PATH
