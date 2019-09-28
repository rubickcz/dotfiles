# functions.sh
# ===============
# Common functions for scripts.

# Color definitions
COLOR_BLUE="\e[1;34m"
COLOR_RED="\e[1;31m"
COLOR_GREEN="\e[1;32m"
COLOR_RESET="\e[0m"

title() {
	echo -e "${COLOR_GREEN}$@${COLOR_RESET}"
}

error() {
	echo -e "${COLOR_RED}ERROR: $@${COLOR_RESET}" 1>&2
}

question() {
	echo -ne "${COLOR_BLUE}$@${COLOR_RESET} "
}

success() {
	echo -e "${COLOR_GREEN}[✔]${COLOR_RESET} $@"
}

yes_no_question() {
    question "$1 [y]"
    read -e ANSWER
    if [ "$ANSWER" == "" ] || [ "$ANSWER" == "y" ]; then
        return 0
    else
        return 1
    fi
}

has_pkg() {
    pacman -Q $1 &>/dev/null
    echo $?
}
