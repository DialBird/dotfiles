# ICONIX Builder

- Doug RosenbergのICONIXメソッドを使用して、指定されたユースケース情報からICONIX成果物を自動生成

## 動作内容

1. ユーザーが提供するユースケース情報（アクター、ゴール、基本フロー等）を分析
2. 適切なユースケース名を決定
3. 以下のファイルを生成：
    - {usecase-name}.md (ビジネス要件)
4. 生成後に品質チェックを実行

## 入力例

/iconix-builder usecase.md

```usecase.md
アクター: 運営者
ゴール: エントリーの審査を行い、承認・差し戻しを決定する
基本フロー: 運営者が審査画面でエントリー内容を確認し、審査結果を入力する
例外条件: エラーケース（オプション）
```

## 出力例

- entry-review.md

## 出力品質

### {usecase-name}.md
- YAML frontmatter (id, title, actor, goal, preconditions, postconditions)
- ビジネス視点での成功シナリオ
- 技術詳細を排除した要件記述
