#
# ~/.bashrc
#

# If not running interactively, don't do anything
[[ $- != *i* ]] && return

### ALIASES ####

alias ls='ls --color=auto'
alias dotfiles='git --git-dir=$HOME/.dotfiles.git/ --work-tree=$HOME'

PS1='[\u@\h \W]\$ '
