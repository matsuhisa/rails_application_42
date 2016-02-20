# Ruby on Rails 4.2 で作るフォーム

Ruby on Railsでフォームを作ってみました。

## 特徴

* 入力、確認、完了の画面があります
* 個人情報を扱うところは、暗号化してデーターベースに保存します
* メール送信処理があります

## 入力項目

* 必須：名前
* 必須：ふりがな
* 必須：性別
 * 男性
 * 女性
* 必須：電話番号
* 必須：メールアドレス
* 一言

## データーベース

```
create_table "event_applications", force: :cascade do |t|
	t.string   "name",       limit: 255,               null: false
	t.string   "name_ruby",  limit: 255,               null: false
	t.integer  "gender",     limit: 1,     default: 0, null: false
	t.string   "email",      limit: 600,               null: false
	t.string   "phone",      limit: 255,               null: false
	t.text     "notes",      limit: 65535
	t.datetime "created_at",                           null: false
	t.datetime "updated_at",                           null: false
end
```

## gem

### letter_opener_web

`letter_opener_web` は、ブラウザーでメールを確認出来るようにするgemです

## データーの暗号化

```Ruby
class EventApplication < ActiveRecord::Base
  SECRETS = Rails.application.secrets.secret_key_base
  MALE    = 1
  FEMALE  = 2

  validates :name, presence: true, length: { maximum: 30 }
  validates :name_ruby, presence: true, length: { maximum: 30 }
  validates :gender, presence: true
  validates :email, presence: true, format: { with: /\A([^@\s]+)@((?:[-a-z0-9]+\.)+[a-z]{2,})\z/i }, length: { maximum: 256 }
  validates :phone, presence: true, length: { maximum: 30 }

  serialize :name, EncryptionSerializer.new(SECRETS)

  enum gender: { male: MALE, female: FEMALE }
end
```

`serialize :name, EncryptionSerializer.new(SECRETS)` とあるところで、暗号化しています。serialize は、`dump` と `load` を実装したオブジェクトならなんでもシリアライズできる（らしい）仕組みを利用しています。

## 課題

* 電話番号のチェック
* Rails でのHTMLメールコーディング
