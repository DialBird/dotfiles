#!/bin/bash

# Required parameters:
# @raycast.schemaVersion 1
# @raycast.title summarize today
# @raycast.mode compact

# Optional parameters:
# @raycast.icon 🤖

# Documentation:
# @raycast.author dialbird
# @raycast.authorURL https://raycast.com/dialbird

# ==== 設定 ====
VAULT_DIR="$HOME/Library/Mobile Documents/iCloud~md~obsidian/Documents/obsidian_knowledge/Memos"
TODAY=$(date +%Y%m%d)
ENV_FILE="$(dirname "$0")/.env"
MODEL="claude-3-opus-20240229"
MAX_TOKENS=1000

# ==== APIキー読み込み ====
if [ -f "$ENV_FILE" ]; then
  source "$ENV_FILE"
else
  echo ".env ファイルが見つかりません。"
  exit 1
fi

if [ -z "$ANTHROPIC_API_KEY" ]; then
  echo "ANTHROPIC_API_KEY が設定されていません。"
  exit 1
fi

# ==== 本日メモの収集 ====
echo "✅ 本日 ($TODAY) のメモを検索中..."

memo_content=""
for file in "$VAULT_DIR"/${TODAY}T*.md; do
  [ -e "$file" ] || continue  # ファイルが存在しない場合スキップ
  echo "📄 $file"
  memo_content+="
# $(basename "$file")
$(cat "$file")

"
done

if [ -z "$memo_content" ]; then
  echo "❌ 本日分のメモは見つかりませんでした。"
  exit 0
fi

# ==== Claude へ送信 ====
echo "🤖 Claude に要約を依頼中..."

escaped_content=$(jq -Rs <<<"以下は本日 $TODAY のメモです。要点を10個以内に箇条書きでまとめてください。

$memo_content")

response=$(curl -s https://api.anthropic.com/v1/messages \
  -H "x-api-key: $ANTHROPIC_API_KEY" \
  -H "anthropic-version: 2023-06-01" \
  -H "content-type: application/json" \
  -d "$(jq -n \
    --arg model "$MODEL" \
    --argjson max_tokens "$MAX_TOKENS" \
    --arg content "$escaped_content" \
    '{
      model: $model,
      max_tokens: $max_tokens,
      messages: [
        {
          role: "user",
          content: $content
        }
      ]
    }')"
)

# ==== 結果の表示 ====
echo "📝 要約結果："
echo "$response" | jq -r '.content[0].text // "❌ Claudeからのレスポンスが不正です"'
echo "==== DEBUG: Claudeからの生レスポンス ===="
echo "$response"
