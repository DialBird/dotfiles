#!/bin/bash

# このスクリプトファイルについて
# 目的: Raycast Script CommandとしてOpenSSLで乱数文字列（Base64またはHex）を生成し、表示とクリップボードへのコピーを行う。
# 入力: 引数1に生成バイト数（正の整数）、引数2にエンコーディング種別（dropdownでbase64またはhex、未指定はBase64）。
# 制約: macOSでOpenSSLとpbcopyが利用可能であること、Raycastのスキーマバージョン1に対応。

# Required parameters:
# @raycast.schemaVersion 1
# @raycast.title Generate Random String
# @raycast.mode fullOutput

# Optional parameters:
# @raycast.icon 🔐
# @raycast.argument1 { "type": "text", "placeholder": "Enter byte count", "optional": false }
# @raycast.argument2 { "type": "dropdown", "placeholder": "Select encoding", "data": [{"title": "Base64", "value": "base64"}, {"title": "Hex", "value": "hex"}], "default": "base64", "optional": true }

# Documentation:
# @raycast.description Generate random string (base64 or hex) using OpenSSL
# @raycast.author dialbird
# @raycast.authorURL https://raycast.com/dialbird

bytes="$1"
encoding_input="$2"

if [ -z "$encoding_input" ] || [ "$encoding_input" = "-" ]; then
    encoding="base64"
else
    encoding="$encoding_input"
fi

# バイト数が指定されているかチェック
if [ -z "$bytes" ]; then
    echo "Error: バイト数を指定してください"
    exit 1
fi

# 数値かどうかチェック
if ! [[ "$bytes" =~ ^[0-9]+$ ]]; then
    echo "Error: バイト数は正の整数で指定してください"
    exit 1
fi

# バイト数が0より大きいかチェック
if [ "$bytes" -le 0 ]; then
    echo "Error: バイト数は1以上で指定してください"
    exit 1
fi

# エンコーディングに応じてOpenSSLコマンドを実行
if [ "$encoding" = "hex" ]; then
    result=$(openssl rand -hex "$bytes")
    encoding_name="Hex"
elif [ "$encoding" = "base64" ]; then
    result=$(openssl rand -base64 "$bytes")
    encoding_name="Base64"
else
    echo "Error: 無効なエンコーディングです（base64またはhexを指定してください）"
    exit 1
fi

if [ $? -eq 0 ]; then
    echo "Generated random $encoding_name ($bytes bytes):"
    echo "$result"
    
    # クリップボードにコピー
    echo "$result" | pbcopy
    echo ""
    echo "✅ クリップボードにコピーしました"
else
    echo "Error: OpenSSLコマンドの実行に失敗しました"
    exit 1
fi
