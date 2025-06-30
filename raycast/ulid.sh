#!/bin/bash

# Required parameters:
# @raycast.schemaVersion 1
# @raycast.title ulid
# @raycast.mode compact

# Optional parameters:
# @raycast.icon 🤖
# @raycast.packageName gen uild

# Documentation:
# @raycast.description generate ULID
# @raycast.author dialbird
# @raycast.authorURL https://raycast.com/dialbird

PATH=/Users/taniguchitakashiryou/.local/share/mise/installs/node/22.17.0/bin:$PATH
npx ulid | pbcopy
echo "Copied to clipboard"
