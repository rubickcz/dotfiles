#
# ~/.bashrc
#

# If not running interactively, don't do anything
[[ $- != *i* ]] && return

# Set path for local scripts and programs (if exists)
[ -d ~/bin ] && PATH=$PATH:$HOME/bin
[ -d ~/bin/scripts ] && PATH=$PATH:$HOME/bin/scripts
export PATH

# History settings
export HISTCONTROL=ignoredups	# Don't store repeat commands
export HISTSIZE=10000		# Store 10000 commands from current session
export HISTFILESIZE=10000	# Keep a record of 10000 commands

# 256 color terminal
# TODO: there should be condition, tty does not support 256 colors
export TERM=xterm-256color

export EDITOR=vim
export PAGER=less

# ALIASES
alias ls='ls -h --color=auto'
alias ll='ls -l'
alias la='ls -a'
alias lla='la -al'
alias grep='grep --color=auto'
alias dotfiles='git --git-dir=$HOME/.dotfiles.git/ --work-tree=$HOME'
alias pingg='ping 8.8.8.8'
alias pacman='sudo pacman'
alias myip='wget -q -O - http://wtfismyip.com/text'
alias pacup='pacman -Syu'
alias cd..='cd ..'
alias wifi='wicd-curses'
alias i3config='vim ~/.i3/config'
alias webserver-here='python -m http.server 8000'
alias top10='find . -type f -exec du -h {} + | sort -rh | head -n 10'
alias feh='feh -F -d -S filename'
alias web='cd projects/website'
alias top10pkg='pacman -Qi|awk '"'"'/^Installed Size/{print int($4), name} /^Name/{name=$3}'"'"'|sort -nr | head -n 10'
alias gotomacan='cd ~/skola/svp/macan'
alias gotomacanbuild='cd ~/skola/svp/macan/build/linux'

# auto complete sudo
complete -cf sudo
complete -cf man
source /etc/bash_completion.d/password-store

# Set prompt
PS1='[\u@\h \W]\$ '

############### Functions ###############

## Backup file
## usage: bak <file>
bak    () { cp -ip "$1" "$1.bak"; }

## Archive extractor
## usage: extract <file>
extract ()
{
  if [ -f $1 ] ; then
    case $1 in
      *.tar.bz2)   tar xjvf "$1"   ;;
      *.tar.gz)    tar xzvf "$1"   ;;
      *.bz2)       bunzip2 "$1"   ;;
      *.rar)       rar x "$1"     ;;
      *.gz)        gunzip "$1"    ;;
      *.tar)       tar xf "$1"    ;;
      *.tbz2)      tar xjf "$1"   ;;
      *.tgz)       tar xzf "$1"   ;;
      *.zip)       unzip "$1"     ;;
      *.Z)         uncompress "$1";;
      *.7z)        7z x "$1"      ;;
      *)           echo "'$1' cannot be extracted via extract()" ;;
    esac
  else
    echo "'$1' is not a valid file"
  fi
}

## TODO and ideas
#  - find files with search pattern
#  - output size of direcotry
#  - youtube video download
#  - image/sound/video manipulation functions
