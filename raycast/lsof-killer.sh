#!/bin/bash

# Required parameters:
# @raycast.schemaVersion 1
# @raycast.title lsof killer
# @raycast.mode compact
# @raycast.argument1 {"type": "text", "placeholder": "3000"}

# Optional parameters:
# @raycast.icon 🤖

# Documentation:
# @raycast.author dialbird
# @raycast.authorURL https://raycast.com/dialbird

PORT=$1

if [ -z "$PORT" ]; then
    echo "ポート番号を指定してください"
    exit 1
fi

if ! [[ "$PORT" =~ ^[0-9]+$ ]]; then
    echo "無効なポート番号です"
    exit 1
fi

PROCESSES=$(lsof -ti :$PORT)

if [ -z "$PROCESSES" ]; then
    echo "ポート $PORT を使用しているプロセスが見つかりません"
    exit 0
fi

echo "ポート $PORT を使用しているプロセス:"
lsof -i :$PORT

echo ""
echo "プロセスを終了します..."
kill $PROCESSES

echo "ポート $PORT のプロセスを終了しました"

