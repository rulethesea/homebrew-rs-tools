#!/usr/bin/env bash
set -euo pipefail

VERSION="0.1.0"

if [[ "${1-}" == "--version" ]]; then
  echo "$VERSION"
  exit 0
fi

# Logic: auto set Google DNS cho tất cả network services
echo "Running RS DNS Guard v$VERSION ..."
# ...
