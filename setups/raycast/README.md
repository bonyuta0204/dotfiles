## Raycast Script Commands

このリポジトリでは、Raycastの Script Commands を `setups/raycast/scripts/` で管理します。
Raycast側にはこのディレクトリを直接登録します（シンボリックリンクは不要）。

### 登録手順

1. Raycast を開く
2. **Preferences** → **Extensions** → **Script Commands** を開く
3. **Add Script Directory** をクリック
4. このリポジトリ内のディレクトリを指定

```
<path-to-dotfiles>/setups/raycast/scripts
```

例:
```
/Users/yourusername/dotfiles/setups/raycast/scripts
```

### 運用ルール

- Script Commands はすべて `setups/raycast/scripts/` 配下に置く
- 新規スクリプト追加後は Raycast 側で自動的に検出される（必要なら再読み込み）
- 既存スクリプト `ws.sh` もこのディレクトリに移動済み
