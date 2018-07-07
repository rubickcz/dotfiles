# Common functions for scripts

# Color definitions
COLOR_BLUE="\e[1;34m"
COLOR_RED="\e[1;31m"
COLOR_GREEN="\e[1;32m"
COLOR_RESET="\e[0m"

PREFIX=""

# generic message prepended with program name
echo_message() {
    echo -e "${COLOR_BLUE}$(basename ${0})${COLOR_RESET}: $@"
}

# Same as message but prints to stderr and in red
error() {
	echo -e "${COLOR_RED}ERROR: $@${COLOR_RESET}" 1>&2
}

# echo higlighted text, suitable for questions for user
msg() {
	echo -e "${COLOR_GREEN}$@${COLOR_RESET}"
}
question() {
	echo -ne "${COLOR_BLUE}$@${COLOR_RESET} "
}
success() {
	echo -e "${COLOR_GREEN}[✔]${COLOR_RESET} $@"
}

# Create dir and check if succeded. If not, terminate.
mkdir_and_check() {
    mkdir -p "$1"
    if [ $? -ne 0 ]; then
        echo_err "Creating directory failed!"
        exit 1
    fi
}

# exit script (launched when user hits Control-C)
control_c() {
    echo -en "\n*** Ouch! Exiting ***\n"
    #cleanup
    exit $?
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
