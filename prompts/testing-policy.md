# Vitest Testing ガイドライン

## 概要

このプロジェクトではVitestを使用してテストを実装する。t_wada（和田卓人）のTDD手法に基づき、テストファーストで設計を駆動し、必要最小限のモックを使用する。

## 基本原則（t_wada TDD手法準拠）

### TDDサイクル

1. **Red**: 失敗するテストを書く
2. **Green**: 最小限の実装でテストを通す
3. **Refactor**: 重複を除去し、設計を改善する

### テストの価値観

- **テストは仕様**: テストコードが要件を表現する
- **テストが設計を導く**: API設計をテストから始める
- **最小限のモック**: 本物が使えるなら本物を使う

### ファイル命名規則

- サービスクラス: `XXXService.ts` → テストファイル: `XXXService.test.ts`

### テスト構造

- **AAA パターン**: Arrange（準備） → Act（実行） → Assert（検証）
- **describe ネスト**: 機能別・ケース別にグループ化
- **テスト名**: 「○○できる」「○○の場合は△△を返す」形式

### モック戦略（t_wada流）

- **モックは最後の手段**: 本物のオブジェクトが使えない場合のみ
- **境界でモック**: 外部システム（DB、API）との境界でのみモック化
- **テストダブルの分類**:
  - **Dummy**: 引数埋めのための偽物
  - **Stub**: 決まった値を返す偽物
  - **Mock**: 呼び出しを検証する偽物
- **型安全なモック**: `MockedObject<T>` を使用
- **beforeEach でリセット**: 各テスト間でのモック状態の分離

## 実装パターン

### 基本ルール

- **テストファイルの位置**: テスト対象のファイル名と同じ階層に同名の`.test.ts`ファイルを作成する
- **マジックナンバー禁止**: ID、数値、文字列リテラルは冒頭で定数化
- **ファクトリー優先**: テストデータ生成は専用ファクトリーを使用
- **期待値の動的化**: ファクトリーの実際の値を期待値として使用
- **Repository層は`MockedObject<T>`**: 外部境界は型安全なモックオブジェクトを使用

### ディレクトリ構造

```
packages/core/
└── test-helpers/
    ├── factories/           # テストデータファクトリー
    │   ├── xxxx-factory.ts
    │   └── index.ts
    ├── mocks/              # モックオブジェクト
    │   └── transaction-manager.mock.ts
    └── test-utils.ts       # 汎用テストユーティリティ
```

### 統合実装サンプル

以下は、最適化されたテストファイルの完全な実装例です：

```ts
// 1. テスト用定数
const TEST_XXX_ID = 1

// 2. ファクトリーモックデータ（テスト用エンティティ）
const mockXXX = buildXXXTestData({
  id: TEST_XXX_ID,
})

// 3. 外部境界（Prisma）のモック定義
const mockXXXCreate = vi.fn()

const mockTx = {
  xxx: { create: mockXXXCreate },
}

describe('XXXService', () => {
  // インスタンス作成のストーリー順で変数宣言
  let mockXXXRepository: MockedObject<XXXRepository>
  let mockYYYRepository: MockedObject<YYYRepository>
  let service: XXXService

  beforeEach(() => {
    // インスタンス作成のストーリー順で初期化
    mockXXXRepository = {
      create: vi.fn(),
      update: vi.fn(),
    } as MockedObject<XXXRepository>

    mockYYYRepository = {
      create: vi.fn(),
      update: vi.fn(),
    } as MockedObject<YYYRepository>

    service = new XXXService(mockXXXRepository, mockYYYRepository)
  })

  // テスト入力データファクトリー
  const createValidInput = (overrides: any = {}) => ({
    id: TEST_XXX_ID,
    ...overrides,
  })

  describe('正常系', () => {
    it('正常に処理できる', async () => {
      // Arrange
      mockXXXRepository.create.mockResolvedValue(mockXXX)

      // Act
      const result = await service.execute(createValidInput())

      // Assert
      assert(result.isOk())

      // 初回テストで詳細な動作仕様を表現し、以降のテストは差分に焦点
      expect(mockXXXRepository.create).toHaveBeenCalledWith(mockXXX)
      expect(mockYYYRepository.create).toHaveBeenCalledWith(mockYYY)
    })

    it('レビューが承認され、ラウンドが開始前の場合、仮エントリーはPASSEDに更新されるが、エントリーは公開されない', async () => {
      // 中略

      // 【2回目テスト】呼び出し有無のみ確認（詳細は初回で検証済み）
      expect(mockXXXRepository.create).toHaveBeenCalled()
      expect(mockYYYRepository.create).not.toHaveBeenCalled()
    })
  })

  describe('エラーパターン', () => {
    it('Reviewingエントリーが見つからない場合、エラーを返す', async () => {
      // Arrange
      mockProvisionalEntryFindUnique.mockResolvedValue(null)

      // Act
      const result = await service.execute(createValidInput())

      // Assert
      assert(result.isErr())

      // 【エラーケース】全ての副作用が呼ばれないことを確認
      expect(mockXXXRepository.create).not.toHaveBeenCalled()
      expect(mockYYYRepository.create).not.toHaveBeenCalled()
    })
  })
})
```

### 重要な設計パターン

#### 1. インスタンス作成のストーリー順

変数宣言と初期化の順序は、**インスタンス作成のストーリー**に従う：

```ts
describe('SampleService', () => {
  // ✅ 依存関係 → サービス の順序で宣言
  let mockRepository: MockedObject<Repository>
  let mockExternalService: MockedObject<ExternalService>
  let service: SampleService

  beforeEach(() => {
    // ✅ 同じ順序で初期化
    mockRepository = { create: vi.fn() } as MockedObject<Repository>
    mockExternalService = { call: vi.fn() } as MockedObject<ExternalService>
    service = new SampleService(mockRepository, mockExternalService)
  })
})
```

#### 2. テスト入力データファクトリーパターン

静的オブジェクトの再利用を避け、ファクトリー関数でテスト入力を生成する：

```ts
// ❌ 避けるべき: 静的オブジェクトの再利用
const validInput = { competitionId: 1, candidateId: 1 }

// ✅ 推奨: ファクトリー関数による生成
const createValidInput = (overrides: Partial<CreateProvisionalEntryInput> = {}): CreateProvisionalEntryInput => ({
  competitionId: TEST_COMPETITION_ID,
  candidateId: TEST_CANDIDATE_ID,
  ...overrides,
})

// 使用例
const result = await service.execute(createValidInput())
const resultWithOverride = await service.execute(createValidInput({ competitionId: 999 }))
```

#### 3. モック検証の使い分け

**`toHaveBeenCalledWith`を使うべき場合:**

- 外部境界との結合部分（Prismaクエリ等）
- ビジネスロジックの分岐条件
- 初回テストケース（仕様確認）

**`toHaveBeenCalled`を使うべき場合:**

- 呼び出し有無のみが重要
- 2回目以降の類似テストケース
- 副作用の確認

### 外部境界の判定とモック化

**外部境界** = アプリケーションが制御できない外部システムとの接点

#### 外部境界の例

- **Repository層**: Prisma → データベースアクセス
- **外部API**: AWS SDK、Google API
- **時間**: `new Date()`、`Date.now()`
- **ランダム**: `Math.random()`、UUID生成
- **ファイルシステム**: `fs.readFile`、`fs.writeFile`

#### 外部境界ではない例

- **Entity/ValueObject**: 純粋なビジネスロジック
- **ドメインサービス**: 副作用のない計算処理
- **アプリケーションサービス**: 制御可能な内部ロジック

## 研究記録

### `vi.mock()`と`vi.hoisted()`が不要になった背景

プロジェクトでのテスト実装研究を通じて、従来のVitestモッキング手法の問題点を発見し、最適化された手法を確立した。

#### 従来の手法の問題点

**1. コードの重複問題**

```ts
// ❌ 従来のパターン：同じ構造を2回定義
const mockGetClient = vi.hoisted(() => vi.fn())
const mockSetClient = vi.hoisted(() => vi.fn())

vi.mock('./module', () => ({
  Manager: vi.fn().mockImplementation(() => ({
    getClient: mockGetClient, // 1回目の定義
    setClient: mockSetClient,
  })),
}))

// beforeEach内で再度同じ構造を作成
beforeEach(() => {
  mockManager = {
    getClient: mockGetClient, // 2回目の定義（重複）
    setClient: mockSetClient,
  } as MockedObject<Manager>
})
```

**2. vi.mock()の実装問題**
実験により判明した事実：

- `vi.mock()`の`mockImplementation`は実際には動作しない
- 空のスパイオブジェクトが返される
- `vi.hoisted()`で定義した関数が使われない

**3. 複雑性の増大**

- ファイル間での依存関係が複雑
- モック定義の責務が分散
- メンテナンスコストの増大

#### 最適化された手法の発見

**研究過程**：

1. `vi.mock()`の動作検証実験を実施
2. `vi.hoisted()`の必要性を段階的に検証
3. `vitest.config.mts`の`clearMocks: true`設定効果を確認
4. グローバル変数定義とbeforeEach作成パターンの比較

**発見した事実**：

- **`clearMocks: true`が完璧に機能**：テスト間でモック状態は自動リセット
- **`vi.mock()`なしでも動作**：describe内での直接作成で十分
- **グローバル定義の安全性**：オブジェクトの参照共有問題は`clearMocks`で解決
