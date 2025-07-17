#!/bin/bash

# Required parameters:
# @raycast.schemaVersion 1
# @raycast.title Open Workspace
# @raycast.mode compact

# Optional parameters:
# @raycast.icon 🤖
# @raycast.argument1 { "type": "dropdown", "placeholder": "Select workspace", "data": [{"title": "Zizai Lab Tasks", "value": "zizai-lab"}, {"title": "Obsidian Knowledge", "value": "obsidian"}, {"title": "Zenn", "value": "zenn"}, {"title": "dotfiles", "value": "dotfiles"}, {"title": "Vote2", "value": "vote2"}, {"title": "Chushindo Shibutyo", "value": "shibutyo"}, {"title": "Dorian", "value": "dorian"}, {"title": "FEEEP Resort", "value": "feeep-resort"}] }

# Documentation:
# @raycast.author dialbird
# @raycast.authorURL https://raycast.com/dialbird

workspace="$1"

case "$workspace" in
"zizai-lab")
    kiro "/Users/taniguchitakashiryou/works/zizai-lab/zizai-lab-tasks"
    ;;
"obsidian")
    kiro "/Users/taniguchitakashiryou/Library/Mobile Documents/iCloud~md~obsidian/Documents/obsidian_knowledge/"
    ;;
"zenn")
    kiro "/Users/taniguchitakashiryou/works/zizai-lab/zenn"
    ;;
"dotfiles")
    kiro "/Users/taniguchitakashiryou/dotfiles"
    ;;
"vote2")
    kiro "/Users/taniguchitakashiryou/works/4NEXT/Vote2"
    ;;
"shibutyo")
    kiro "/Users/taniguchitakashiryou/works/zizai-lab/Chushindo/shibutyo"
    ;;
"dorian")
    kiro "/Users/taniguchitakashiryou/works/zizai-lab/Dorian"
    ;;
"feeep-resort")
    kiro "/Users/taniguchitakashiryou/works/4NEXT/FEEEP-Resort"
    ;;
*)
    echo "Error: Invalid workspace selection"
    exit 1
    ;;
esac
