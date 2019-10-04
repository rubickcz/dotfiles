#
# ~/.bashrc
#

source ~/.bash_git

# If not running interactively, don't do anything
[[ $- != *i* ]] && return

# Set path for local scripts and programs (if exists)
[ -d ~/bin ] && PATH=$PATH:$HOME/bin
[ -d ~/bin/scripts ] && PATH=$PATH:$HOME/bin/scripts
export PATH

# History settings
export HISTCONTROL=ignoreboth	# Don't store duplications and commands beginning with a space
export HISTSIZE=10000			# Store 10000 commands from current session
export HISTFILESIZE=10000		# Keep a record of 10000 commands

# 256 color terminal
export TERM=xterm-256color

export EDITOR=vim
export PAGER=less

###################################################
# ALIASES                                         #
###################################################

alias ls='ls -h --color=auto'
alias ll='ls -l'
alias la='ls -a'
alias lla='la -al'
alias mc='. /usr/lib/mc/mc-wrapper.sh'
alias grep='grep --color=auto'
alias pingg='ping 8.8.8.8'
# show current public IP address
alias myip='wget -q -O - http://wtfismyip.com/text'
alias pacup='sudo yay -Syu'
alias cd..='cd ..'
alias i3config='vim ~/.i3/config'
alias vimrc='vim ~/.vimrc'
alias webserver-here='python -m http.server 8000'
# show top 10 largest files in the current dir
alias top10='find . -type f -exec du -h {} + | sort -rh | head -n 10'
alias feh='feh -F -d -S filename'
# top 10 largest installed packages
alias top10pkg='pacman -Qi|awk '"'"'/^Installed Size/{print int($4), name} /^Name/{name=$3}'"'"'|sort -nr | head -n 10'
# show dirs not owned by any package
alias pacman-disowned-dirs="comm -23 <(sudo find / \( -path '/dev' -o -path '/sys' -o -path '/run' -o -path '/tmp' -o -path '/mnt' -o -path '/srv' -o -path '/proc' -o -path '/boot' -o -path '/home' -o -path '/root' -o -path '/media' -o -path '/var/lib/pacman' -o -path '/var/cache/pacman' \) -prune -o -type d -print | sed 's/\([^/]\)$/\1\//' | sort -u) <(pacman -Qlq | sort -u)"
# show files not owned by any package
alias pacman-disowned-files="comm -23 <(sudo find / \( -path '/dev' -o -path '/sys' -o -path '/run' -o -path '/tmp' -o -path '/mnt' -o -path '/srv' -o -path '/proc' -o -path '/boot' -o -path '/home' -o -path '/root' -o -path '/media' -o -path '/var/lib/pacman' -o -path '/var/cache/pacman' \) -prune -o -type f -print | sort -u) <(pacman -Qlq | sort -u)"
alias spotify="spotify --force-device-scale-factor=2"

###################################################

# auto complete sudo
complete -cf sudo
complete -cf man

# Set prompt
export PS1="\u@\h:\[\033[1;34m\]\w\[\033[1;33m\]\$(__git_ps1)\[\033[00m\] $ "

# disable XOFF (terminal freeze by pressing Ctrl-S)
stty ixany
stty ixoff -ixon

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

passgen()
{
    LEN=$1
    if [ -z $LEN ]; then
        LEN=50
    fi
    </dev/urandom tr -dc 'A-Za-z0-9!"#$%&'\''()*+,-./:;<=>?@[\]^_`{|}~' | head -c $LEN  ; echo
}

# include private settings
PRIVATE_BASHRC=".bashrc_private"
if [ -f $PRIVATE_BASHRC ]; then
    source $PRIVATE_BASHRC
else
    echo "Warning! File $PRIVATE_BASHRC was not found."
fi

# virtualenvwrapper
export WORKON_HOME=$HOME/other/venvs
export PROJECT_HOME=$HOME/projects
source /usr/bin/virtualenvwrapper.sh
