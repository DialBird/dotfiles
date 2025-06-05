[![Dialbird's github stats](https://github-readme-stats.vercel.app/api?username=dialbird)](https://github.com/anuraghazra/github-readme-stats)

# セットアップ

```bash
$ cd
$ git clone https://github.com/DialBird/dotfiles.git
$ cd dotfiles

# dotfilesをインストール
$ make install

# 現在の状態を確認
$ make status

# ヘルプを表示
$ make help

# pureというcolorテーマを使っている
$ npm install --global pure-prompt

# 必要なagとfzfをインストール
$ brew install ag fzf
$ $(brew --prefix)/opt/fzf/install
```

## Makefileコマンド

- `make install` - dotfilesをシンボリックリンクとしてインストール
- `make status` - 現在のdotfilesの状態を表示
- `make clean` - シンボリックリンクを削除
- `make backup` - 現在のdotfilesをバックアップ
- `make help` - ヘルプメッセージを表示

# ツール
- jarファイルなどは、`~/tools`ディレクトリに配置してエイリアス
- epubcheckをダウンロードして、
