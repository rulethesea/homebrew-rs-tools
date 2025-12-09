#!/usr/bin/env bash

# Strict mode
set -euo pipefail

# ANSI Color Codes
RESET='\e[0m'
BOLD='\e[1m'
DIM='\e[2m'
FG_CYAN='\e[96m'
FG_MAGENTA='\e[95m'
FG_YELLOW='\e[33m'

# Box configuration
BOX_WIDTH=70
BORDER_CHAR='═'
CORNER_TL='╔'
CORNER_TR='╗'
CORNER_BL='╚'
CORNER_BR='╝'
SIDE='║'

# Strip ANSI escape sequences to get actual text length
strip_ansi() {
    local text="$1"
    echo -e "$text" | sed 's/\x1b\[[0-9;]*m//g'
}

# Print top or bottom border
print_border() {
    local border_type="$1"  # "top" or "bottom"
    local i
    local line=""
    
    # Build horizontal line by repeating BORDER_CHAR
    for ((i=0; i<BOX_WIDTH-2; i++)); do
        line+="${BORDER_CHAR}"
    done
    
    if [[ "$border_type" == "top" ]]; then
        printf "${FG_YELLOW}${CORNER_TL}${line}${CORNER_TR}${RESET}\n"
    else
        printf "${FG_YELLOW}${CORNER_BL}${line}${CORNER_BR}${RESET}\n"
    fi
}

# Print an empty line with borders
print_empty_line() {
    printf "${FG_YELLOW}${SIDE}${RESET}"
    printf '%*s' $((BOX_WIDTH - 2)) ''
    printf "${FG_YELLOW}${SIDE}${RESET}\n"
}

# Print a centered line with borders
# Args: $1 - text (may contain ANSI codes)
print_centered_line() {
    local text="$1"
    local plain_text
    plain_text=$(strip_ansi "$text")
    local text_len=${#plain_text}
    local padding=$(( (BOX_WIDTH - 2 - text_len) / 2 ))
    local right_padding=$(( BOX_WIDTH - 2 - text_len - padding ))
    
    printf "${FG_YELLOW}${SIDE}${RESET}"
    printf '%*s' "$padding" ''
    printf "${text}"
    printf '%*s' "$right_padding" ''
    printf "${FG_YELLOW}${SIDE}${RESET}\n"
}

# Print the welcome banner
print_banner() {
    echo ""
    print_border "top"
    print_empty_line
    print_centered_line "${BOLD}${FG_MAGENTA}${FG_CYAN}HESMAN${RESET}"
    print_empty_line
    print_centered_line "${DIM}${FG_MAGENTA}Security service from RULE THE SEA${RESET}"
    print_empty_line
    print_border "bottom"
    echo ""
}

# Main execution
main() {
    print_banner
    exit 0
}

# Run main function
main
