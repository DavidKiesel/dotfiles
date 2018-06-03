# .bash_profile

# bash-specific code to execute at start of interactive login shells

# examples:
#
# - logging in at a console
# - opening a new terminal window
# - sudo -i -u someuser
# - su - someuser
# - bash --login

# see https://www.gnu.org/software/bash/manual/html_node/Bash-Startup-Files.html

# tasks:
#
# - source .common_profile
#   - common sh-like shell code to execute at start of interactive login
#     shells
# - set bash-specific environment variables
# - source .bashrc
#   - bash shell code needed on every interactive invocation
#     whether a login shell or not

##############################################################################
# source .common_profile 

if [ -f "${HOME}/.common_profile" ]
then
	. "${HOME}/.common_profile"
fi

##############################################################################
# set BASH_ENV

BASH_ENV="${HOME}/.bashrc_notty"
export BASH_ENV

##############################################################################
# set prompts

# root or not root
if [ "$UID" == 0 ]
then
	PS1='
'${ansi_fg_red}'\u@\h:'${ansi_fg_cyan}'\w'${ansi_nc}'
# '
else
	PS1='
'${ansi_fg_cyan}'\u@\h:\w'${ansi_nc}'
$ '
fi
export PS1

##############################################################################
# set permissions mask;
# all permisisons to self; others, group get no permissions
umask 0077

##############################################################################
# bash history options

# number of commands of current session to keep in memory
HISTSIZE=5000
export HISTSIZE

# number of commands to store in ${HOME}/.bash_history
HISTFILESIZE=5000
export HISTFILESIZE

# history ignores duplicate commands and commands with leading whitespace
HISTCONTROL=ignoreboth
export HISTCONTROL

##############################################################################
# source .bashrc 

if [ -f "${HOME}/.bashrc" ]
then
	. "${HOME}/.bashrc"
fi
