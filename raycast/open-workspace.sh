#!/bin/bash

# Required parameters:
# @raycast.schemaVersion 1
# @raycast.title Open Workspace
# @raycast.mode compact

# Optional parameters:
# @raycast.icon 🤖
# @raycast.argument1 { "type": "dropdown", "placeholder": "Select workspace", "data": [{"title": "Obsidian Knowledge", "value": "obsidian"}, {"title": "Zenn", "value": "zenn"}, {"title": "dotfiles", "value": "dotfiles"}, {"title": "Vote2", "value": "vote2"}, {"title": "Chushindo Shibutyo", "value": "shibutyo"}, {"title": "Dorian", "value": "dorian"}, {"title": "FEEEP Resort", "value": "feeep-resort"}, {"title": "NEXUS", "value": "NEXUS"}] }

# Documentation:
# @raycast.author dialbird
# @raycast.authorURL https://raycast.com/dialbird

workspace="$1"

case "$workspace" in
"dorian")
    cursor "/Users/taniguchitakashiryou/works/zizai-lab/Dorian"
    ;;
"dotfiles")
    cursor "/Users/taniguchitakashiryou/dotfiles"
    ;;
"feeep-resort")
    cursor "/Users/taniguchitakashiryou/works/4NEXT/FEEEP-Resort"
    ;;
"NEXUS")
    cursor "/Users/taniguchitakashiryou/works/zizai-lab/NEXUS"
    ;;
"obsidian")
    cursor "/Users/taniguchitakashiryou/Library/Mobile Documents/iCloud~md~obsidian/Documents/obsidian_knowledge/"
    ;;
"shibutyo")
    cursor "/Users/taniguchitakashiryou/works/zizai-lab/Chushindo/shibutyo"
    ;;
"vote2")
    cursor "/Users/taniguchitakashiryou/works/4NEXT/Vote2"
    ;;
"zenn")
    cursor "/Users/taniguchitakashiryou/works/zizai-lab/zenn"
    ;;
*)
    echo "Error: Invalid workspace selection"
    exit 1
    ;;
esac
