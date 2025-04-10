#!/usr/bin/env bash
iatest=$(expr index "$-" i)
# ~/.bashrc: executed by bash(1) for non-login shells.
# see /usr/share/doc/bash/examples/startup-files (in the package bash-doc)
# for examples
echo "~/.bashrc" >> ~/test.log

# Source global definitions
if [ -f /etc/bashrc ]; then
    . /etc/bashrc
fi

# Enable bash programmable completion features in interactive shells
if [ -f /usr/share/bash-completion/bash_completion ]; then
    . /usr/share/bash-completion/bash_completion
elif [ -f /etc/bash_completion ]; then
    . /etc/bash_completion
fi

# Disables ctrl-s and ctrl-q (Used To Pause Term)
[[ $- == *i* ]] && stty -ixon

# cd in dir by just typing name
shopt -s autocd

# Disable the bell
if [[ $iatest -gt 0 ]]; then bind "set bell-style visible"; fi

# check the window size after each command and, if necessary,
# update the values of LINES and COLUMNS.
shopt -s checkwinsize

# Causes bash to append to history instead of overwriting it so if you start
# a new terminal, you have old session history
shopt -s histappend
PROMPT_COMMAND='history -a'

# If set, the pattern "**" used in a pathname expansion context will
# match all files and zero or more directories and subdirectories.
shopt -s globstar

# Ignore case on auto-completion
# Note: bind used instead of sticking these in .inputrc
if [[ $iatest -gt 0 ]]; then bind "set completion-ignore-case on"; fi

# Show auto-completion list automatically, without double tab
if [[ $iatest -gt 0 ]]; then bind "set show-all-if-ambiguous On"; fi

# Check if ripgrep is installed
if command -v rg &> /dev/null; then
    # Alias grep to rg if ripgrep is installed
    alias grep='rg'
fi

# clear screen in alacritty
bind '"\C-l":clear-screen'

# vi mode in bash
set -o vi

# commandline / prompt
if command -v starship &> /dev/null; then
    eval "$(starship init bash)"
fi

# eval "$(aactivator init)"

# # Colour codes
# RED="\\[\\e[1;31m\\]"
# GREEN="\\[\\e[1;32m\\]"
# YELLOW="\\[\\e[1;33m\\]"
# BLUE="\\[\\e[1;34m\\]"
# MAGENTA="\\[\\e[1;35m\\]"
# CYAN="\\[\\e[1;36m\\]"
# WHITE="\\[\\e[1;37m\\]"
# ENDC="\\[\\e[0m\\]"
#
# # Set a two-line prompt. If accessing via ssh include 'ssh-session' message.
# if [[ -n "$SSH_CLIENT" ]]; then ssh_message="-ssh_session"; fi
# PS1="${MAGENTA}\t ${GREEN}\u ${WHITE}at ${YELLOW}\h${RED}${ssh_message} ${WHITE}in ${BLUE}\w \n${CYAN}\$${ENDC} "

# Alias, function and export definitions.
# You may want to put all your additions into a separate file like
# ~/.bash_aliases, instead of adding them here directly.
# See /usr/share/doc/bash-doc/examples in the bash-doc package.

if [ -f ~/.bash_exp ]; then
    . ~/.bash_exp
fi
if [ -f ~/.bash_fun ]; then
    . ~/.bash_fun
fi
if [ -f ~/.bash_alias ]; then
    . ~/.bash_alias
fi
