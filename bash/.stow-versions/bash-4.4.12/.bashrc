# .bashrc

# this file is automatically sourced for interactive non-login shells;
# ${HOME}/.bash_profile, which is automatically sourced for interactive login
# shells, may be set to source this file

# see https://www.gnu.org/software/bash/manual/html_node/Bash-Startup-Files.html

# tasks:
#
# - set shell options
# - set aliases
# - set functions

##############################################################################
# set shell options through set;
# - to enable; + to disable;
# defaults are listed first and commented out if overridden

# https://www.gnu.org/software/bash/manual/html_node/The-Set-Builtin.html

# to see defaults:
#
# bash --noprofile
# set +o
# exit

# to generate code:
#
# bash --noprofile
# set +o \
# |
# while read line
# do
#     echo "# "
#     echo "${line}"
#     echo
# done \
# |
# gview - &>/dev/null
# exit

# Each variable or function that is created or modified is given the export
# attribute and marked for export to the environment of subsequent commands. 
set +o allexport

# The shell will perform brace expansion.
# E.g.,
# echo a{d,c,b}e
# ade ace abe
set -o braceexpand

# Use an emacs-style line editing interface. This also affects the editing
# interface used for read -e.
set -o emacs

# Exit immediately if a pipeline, which may consist of a single simple command,
# a list, or a compound command returns a non-zero status.
set +o errexit

# If set, any trap on ERR is inherited by shell functions, command
# substitutions, and commands executed in a subshell environment.
set +o errtrace

# If set, any trap on DEBUG and RETURN are inherited by shell functions,
# command substitutions, and commands executed in a subshell environment.
set +o functrace

# Locate and remember (hash) commands as they are looked up for execution.
set -o hashall

# Enable ‘!’ style history substitution.
set -o histexpand

# Enable command history.
set -o history

# An interactive shell will not exit upon reading EOF.
set +o ignoreeof

# enable/disable this in shopt instead;
# http://lists.gnu.org/archive/html/bug-bash/2014-05/msg00001.html
#set -o interactive-comments

# All arguments in the form of assignment statements are placed in the
# environment for a command, not just those that precede the command name.
set +o keyword

# Job control is enabled.  All processes run in a separate process group. When
# a background job completes, the shell prints a line containing its exit
# status.
set -o monitor

# Prevent output redirection using ‘>’, ‘>&’, and ‘<>’ from overwriting
# existing files. 
set +o noclobber

# Read commands but do not execute them. This may be used to check a script for
# syntax errors. This option is ignored by interactive shells.
set +o noexec

# Disable filename expansion (globbing).
set +o noglob

# Currently ignored.
#set +o nolog

# Cause the status of terminated background jobs to be reported immediately,
# rather than before printing the next primary prompt.
set +o notify

# Treat unset variables and parameters other than the special parameters ‘@’ or
# ‘*’ as an error when performing parameter expansion. An error message will be
# written to the standard error, and a non-interactive shell will exit.
set +o nounset

# Exit after reading and executing one command.
set +o onecmd

# If set, do not resolve symbolic links when performing commands such as cd
# which change the current directory. The physical directory is used instead.
set +o physical

# If set, the return value of a pipeline is the value of the last (rightmost)
# command to exit with a non-zero status, or zero if all commands in the
# pipeline exit successfully.
set +o pipefail

# Change the behavior of Bash where the default operation differs from the
# POSIX standard to match the standard.
set +o posix

# Turn on privileged mode.
set +o privileged

# Print shell input lines as they are read.
set +o verbose

# Use a vi-style line editing interface. This also affects the editing
# interface used for read -e.
set +o vi

# Print a trace of simple commands, for commands, case commands, select
# commands, and arithmetic for commands and their arguments or associated word
# lists after they are expanded and before they are executed. The value of the
# PS4 variable is expanded and the resultant value is printed before the
# command and its expanded arguments.
set +o xtrace

##############################################################################
# set shell options through shopt

# defaults are listed first and commented out if overridden

# https://www.gnu.org/software/bash/manual/html_node/The-Shopt-Builtin.html

# to see defaults:
#
# bash --noprofile
# shopt
# exit

# to generate code:
#
# bash --noprofile
# shopt \
# |
# while read opt arg
# do
#     echo "# "
#     if [ "${arg}" = off ]
#     then
#         echo "shopt -u ${opt}"
#     else
#         echo "shopt -s ${opt}"
#     fi
#     echo
# done \
# |
# gview - &>/dev/null
# exit

# If set, a command name that is the name of a directory is executed as if it
# were the argument to the cd command.
#shopt -u autocd
shopt -s autocd

# If this is set, an argument to the cd builtin command that is not a directory
# is assumed to be the name of a variable whose value is the directory to
# change to.
shopt -u cdable_vars

# If set, minor errors in the spelling of a directory component in a cd command
# will be corrected.
shopt -u cdspell

# If this is set, Bash checks that a command found in the hash table exists
# before trying to execute it.
shopt -u checkhash

# If set, Bash lists the status of any stopped and running jobs before exiting
# an interactive shell. If any jobs are running, this causes the exit to be
# deferred until a second exit is attempted without an intervening command. The
# shell always postpones exiting if any jobs are stopped.
#shopt -u checkjobs
shopt -s checkjobs

# If set, Bash checks the window size after each command and, if necessary,
# updates the values of LINES and COLUMNS.
shopt -s checkwinsize

# If set, Bash attempts to save all lines of a multiple-line command in the
# same history entry. This allows easy re-editing of multi-line commands.
shopt -s cmdhist

# If set, Bash changes its behavior to that of version 3.1 with respect to
# quoted arguments to the conditional command’s ‘=~’ operator and with respect
# to locale-specific string comparison when using the [[ conditional command’s
# ‘<’ and ‘>’ operators. Bash versions prior to bash-4.1 use ASCII collation
# and strcmp(3); bash-4.1 and later use the current locale’s collation sequence
# and strcoll(3). 
shopt -u compat31

# If set, Bash changes its behavior to that of version 3.2 with respect to
# locale-specific string comparison when using the [[ conditional command’s ‘<’
# and ‘>’ operators and the effect of interrupting a command list. Bash
# versions 3.2 and earlier continue with the next command in the list after one
# terminates due to an interrupt.
shopt -u compat32

# If set, Bash changes its behavior to that of version 4.0 with respect to
# locale-specific string comparison when using the [[ conditional command’s ‘<’
# and ‘>’ operators and the effect of interrupting a command list. Bash
# versions 4.0 and later interrupt the list as if the shell received the
# interrupt; previous versions continue with the next command in the list. 
shopt -u compat40

# If set, Bash, when in POSIX mode, treats a single quote in a double-quoted
# parameter expansion as a special character. The single quotes must match (an
# even number) and the characters between the single quotes are considered
# quoted. This is the behavior of POSIX mode through version 4.1. The default
# Bash behavior remains as in previous versions. 
shopt -u compat41

# If set, Bash does not process the replacement string in the pattern
# substitution word expansion using quote removal. 
shopt -u compat42

# If set, Bash does not print a warning message if an attempt is made to use a
# quoted compound array assignment as an argument to declare, makes word
# expansion errors non-fatal errors that cause the current command to fail (the
# default behavior is to make them fatal errors that cause the shell to exit),
# and does not reset the loop state when a shell function is executed (this
# allows break or continue in a shell function to affect loops in the caller’s
# context). 
shopt -u compat43

# If set, Bash quotes all shell metacharacters in filenames and directory names
# when performing completion. If not set, Bash removes metacharacters such as
# the dollar sign from the set of characters that will be quoted in completed
# filenames when these metacharacters appear in shell variable references in
# words to be completed.
shopt -s complete_fullquote

# If set, Bash replaces directory names with the results of word expansion when
# performing filename completion. This changes the contents of the readline
# editing buffer. If not set, Bash attempts to preserve what the user typed.
shopt -u direxpand

# If set, Bash attempts spelling correction on directory names during word
# completion if the directory name initially supplied does not exist. 
shopt -u dirspell

# If set, Bash includes filenames beginning with a ‘.’ in the results of
# filename expansion. 
shopt -u dotglob

# If this is set, a non-interactive shell will not exit if it cannot execute
# the file specified as an argument to the exec builtin command. An interactive
# shell does not exit if exec fails. 
shopt -u execfail

# If set, aliases are expanded as described below under Aliases, Aliases. 
shopt -s expand_aliases

# If set at shell invocation, arrange to execute the debugger profile before
# the shell starts, identical to the --debugger option. If set after
# invocation, behavior intended for use by debuggers is enabled.
shopt -u extdebug

# If set, the extended pattern matching features described above are enabled.
shopt -s extglob

# If set, $'string' and $"string" quoting is performed within ${parameter}
# expansions enclosed in double quotes. 
shopt -s extquote

# If set, patterns which fail to match filenames during filename expansion
# result in an expansion error.
shopt -u failglob

# If set, the suffixes specified by the FIGNORE shell variable cause words to
# be ignored when performing word completion even if the ignored words are the
# only possible completions.
shopt -s force_fignore

# If set, range expressions used in pattern matching bracket expressions (see
# Pattern Matching) behave as if in the traditional C locale when performing
# comparisons. That is, the current locale’s collating sequence is not taken
# into account, so ‘b’ will not collate between ‘A’ and ‘B’, and upper-case and
# lower-case ASCII characters will collate together. 
#shopt -u globasciiranges
shopt -s globasciiranges

# If set, the pattern ‘**’ used in a filename expansion context will match all
# files and zero or more directories and subdirectories. If the pattern is
# followed by a ‘/’, only directories and subdirectories match. 
#shopt -u globstar
shopt -s globstar

# If set, shell error messages are written in the standard GNU error message
# format.
shopt -u gnu_errfmt

# If set, the history list is appended to the file named by the value of the
# HISTFILE variable when the shell exits, rather than overwriting the file. 
#shopt -u histappend
shopt -s histappend

# If set, and Readline is being used, a user is given the opportunity to
# re-edit a failed history substitution. 
shopt -u histreedit

# If set, and Readline is being used, the results of history substitution are
# not immediately passed to the shell parser. Instead, the resulting line is
# loaded into the Readline editing buffer, allowing further modification. 
shopt -u histverify

# If set, and Readline is being used, Bash will attempt to perform hostname
# completion when a word containing a ‘@’ is being completed. 
shopt -s hostcomplete

# If set, Bash will send SIGHUP to all jobs when an interactive login shell
# exits.
shopt -u huponexit

# If set, command substitution inherits the value of the errexit option,
# instead of unsetting it in the subshell environment. This option is enabled
# when POSIX mode is enabled. 
shopt -u inherit_errexit

# Allow a word beginning with ‘#’ to cause that word and all remaining
# characters on that line to be ignored in an interactive shell. This option is
# enabled by default.
shopt -s interactive_comments

# If set, and job control is not active, the shell runs the last command of a
# pipeline not executed in the background in the current shell environment. 
shopt -u lastpipe

# If enabled, and the cmdhist option is enabled, multi-line commands are saved
# to the history with embedded newlines rather than using semicolon separators
# where possible. 
#shopt -u lithist
shopt -s lithist

# The shell sets this option if it is started as a login shell. The value may
# not be changed. 
shopt -u login_shell

# If set, and a file that Bash is checking for mail has been accessed since the
# last time it was checked, the message "The mail in mailfile has been read" is
# displayed. 
shopt -u mailwarn

# If set, and Readline is being used, Bash will not attempt to search the PATH
# for possible completions when completion is attempted on an empty line. 
shopt -u no_empty_cmd_completion

# If set, Bash matches filenames in a case-insensitive fashion when performing
# filename expansion.
shopt -u nocaseglob

# If set, Bash matches patterns in a case-insensitive fashion when performing
# matching while executing case or [[ conditional commands, when performing
# pattern substitution word expansions, or when filtering possible completions
# as part of programmable completion. 
shopt -u nocasematch

# If set, Bash allows filename patterns which match no files to expand to a
# null string, rather than themselves. 
shopt -u nullglob

# If set, the programmable completion facilities are enabled.
shopt -s progcomp

# If set, prompt strings undergo parameter expansion, command substitution,
# arithmetic expansion, and quote removal after being expanded as described
# below.
shopt -s promptvars

# The shell sets this option if it is started in restricted mode. The value may
# not be changed. This is not reset when the startup files are executed,
# allowing the startup files to discover whether or not a shell is
# restricted.
shopt -u restricted_shell

# If this is set, the shift builtin prints an error message when the shift
# count exceeds the number of positional parameters. 
shopt -u shift_verbose

# If set, the source builtin uses the value of PATH to find the directory
# containing the file supplied as an argument.
shopt -s sourcepath

# If set, the echo builtin expands backslash-escape sequences by default. 
shopt -u xpg_echo

##############################################################################
# bindable readline commands

# https://www.gnu.org/software/bash/manual/html_node/Bindable-Readline-Commands.html

# to list key bindings, execute `bind -P` or `bind -p`

# can use bind commands here or specify behavior in ${HOME}/.inputrc

##############################################################################
# common aliases

if [ -f "${HOME}/.common_alias" ]
then
        . "${HOME}/.common_alias"
fi

##############################################################################
# bash-specific aliases

if [ -f "${HOME}/.bash_alias" ]
then
        . "${HOME}/.bash_alias"
fi

##############################################################################
# common functions

if [ -f "${HOME}/.common_functions" ]
then
        . "${HOME}/.common_functions"
fi

##############################################################################
# bash-specific functions

if [ -f "${HOME}/.bash_functions" ]
then
        . "${HOME}/.bash_functions"
fi

##############################################################################
# local machine bash commands

if [ -f "${HOME}/.bashrc_local" ]
then
        . "${HOME}/.bashrc_local"
fi
