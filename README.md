# Ruby on Rails 4.2 で作るフォーム

## 項目

* 名前
* ふりがな
* 性別
 * 男性
 * 女性
* 電話番号
* メールアドレス
* 一言

### 型

* テキスト（string）
* テキスト（text）
* ラジオボタン

```
rails new application_42
```

```
rails g model EventApplication name:string name_ruby:string gender:boolean email:string phone:string notes:text
```

### routes

設定の確認

* http://localhost:3000/rails/info/routes

## 課題

* データの暗号化と確認機能
* 電話番号のチェック
