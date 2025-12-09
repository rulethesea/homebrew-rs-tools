#!/usr/bin/env bash

# Guard script to check if the current OS is macOS
# This script should be sourced or called by other scripts to ensure
# they only run on macOS systems.

set -euo pipefail

# Detect the current operating system
OS_NAME="$(uname -s)"

# Check if the OS is macOS (Darwin)
if [[ "${OS_NAME}" != "Darwin" ]]; then
  echo "This tool only supports macOS. Detected OS: ${OS_NAME}." >&2
  exit 1
fi

# macOS detected - exit silently with success
exit 0
