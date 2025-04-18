設定ファイルを食べさせたgpt-4oで生成

---

# Neovim 設定マニュアル

## 📄 概要

このNeovim設定は、Python開発を中心にターミナル操作やバッファ管理の効率化を目的としたカスタム設定です。Fernによるファイルツリー、CoCによる補完、Lazy.nvimによるプラグイン管理が特徴です。

---

## 🧩 使用プラグイン一覧

| プラグイン名 | 説明 | 依存プラグイン |
|--------------|------|----------------|
| lazy.nvim | プラグインマネージャ | なし |
| fern.vim | ファイラ | fern-git-status.vim, fern-renderer-nerdfont.vim, nerdfont.vim |
| fern-git-status.vim | fern用Gitステータス表示 | なし |
| fern-renderer-nerdfont.vim | fern用アイコン表示 | nerdfont.vim |
| nerdfont.vim | アイコン提供 | なし |
| rustaceanvim | Rust開発支援 | なし |
| yanky.nvim | ヤンク履歴管理 | なし |
| vim-commentary | コメントトグル | なし |
| vim-airline | ステータスライン強化 | なし |
| coc.nvim | LSP・補完・フォーマッタ統合 | coc-settings.json参照 |
| nord.nvim | カラースキーム | なし |
| fzf.vim | Fuzzy検索 | fzf本体（別途インストール必要） |
| gen.nvim | AI補助（推測される） | なし |

---

## ⌨️ キーマッピング一覧

### 一般操作

| キー | モード | 説明 |
|------|--------|------|
| `<Leader>q` | Normal | 全てのバッファ・ウィンドウを閉じて終了（`:qa`） |

### バッファ操作

| キー | モード | 説明 |
|------|--------|------|
| `<C-l>` | Normal | 次のバッファへ |
| `<C-h>` | Normal | 前のバッファへ |
| `<C-d>` | Normal | 現在のバッファを削除 |

### ターミナル操作

| キー | モード | 説明 |
|------|--------|------|
| `<C-t>` | Normal | 現在のウィンドウにターミナル起動 |
| `<C-t>x` | Normal | 横分割してターミナル起動 |
| `<Esc>` | Terminal | ノーマルモードに戻る（`<C-\><C-n>`） |

### Python 実行

| キー | モード | 説明 |
|------|--------|------|
| `<F5>` | Normal / Insert | 保存してPoetryでPythonスクリプトを実行（カスタム関数） |

### Fern（ファイルツリー）

| キー | モード | 説明 |
|------|--------|------|
| `<Leader>e` | Normal | FernをDrawerモードで開閉（`-stay` 付き） |
| `N` | Normal（fern内） | 新しいDrawerウィンドウとしてFernを開く |

---

## 🛠️ カスタム機能

### ターミナル自動生成 & 再利用

- `functions.lua` では `open_terminal()` 関数により、既存のターミナルバッファを検索し、存在しない場合は新規作成。
- `run_python()` 関数は `F5` キーで発火。現在のPythonファイルを保存後、Poetryを使ってターミナル上で実行する。

```lua
local cmd = string.format('cd "%s" && poetry run python "%s"\n', ...)
vim.fn.chansend(terminal_job_id, cmd)
```

### Fern の詳細カスタマイズ

- 非表示ファイルを表示 (`fern#default_hidden = 1`)
- Nerd Font レンダラーを指定
- `fern_git_status#disable_*` 系オプションでGit表示の調整
- Fernファイルタイプ時に行番号・サインカラム等を無効化

---

## ⚙️ 基本オプション設定

- エンコーディング：UTF-8
- インデント：スペース2つ、Smart/Auto indent有効
- 検索：ハイライト有効
- バックアップ：`undofile` + `~/.config/nvim/undo` に保存
- クリップボード：システムクリップボードと共有（`unnamedplus`）

---
