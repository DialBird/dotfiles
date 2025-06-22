#!/bin/bash

# Required parameters:
# @raycast.schemaVersion 1
# @raycast.title Open Workspace
# @raycast.mode compact

# Optional parameters:
# @raycast.icon 🤖
# @raycast.argument1 { "type": "dropdown", "placeholder": "Select workspace", "data": [{"title": "Zizai Lab Tasks", "value": "zizai-lab"}, {"title": "Obsidian Knowledge", "value": "obsidian"}, {"title": "Zenn", "value": "zenn"}, {"title": "dotfiles", "value": "dotfiles"}] }

# Documentation:
# @raycast.author dialbird
# @raycast.authorURL https://raycast.com/dialbird

workspace="$1"

case "$workspace" in
"zizai-lab")
    code "/Users/taniguchitakashiryou/works/zizai-lab/zizai-lab-tasks"
    ;;
"obsidian")
    code "/Users/taniguchitakashiryou/Library/Mobile Documents/iCloud~md~obsidian/Documents/obsidian_knowledge/"
    ;;
"zenn")
    code "/Users/taniguchitakashiryou/works/zizai-lab/zenn"
    ;;
"dotfiles")
    code "/Users/taniguchitakashiryou/dotfiles"
    ;;
*)
    echo "Error: Invalid workspace selection"
    exit 1
    ;;
esac
