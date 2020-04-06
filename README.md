## アプリケーション概要
- フリーマーケットサイト「メルカリ」のクローンアプリケーション

## アプリケーションの機能一覧
- Basic認証機能
- ユーザー新規登録機能
- ユーザーログイン／ログアウト機能
- マイページ表示機能
- 出品中商品表示機能
- クレジットカード登録／削除機能
- 商品出品／編集／削除機能
- 商品購入機能

## アプリケーションで使用している技術一覧
|種別|名称|
|---|---|
|開発言語|Ruby(ver 2.6.3)|
|フレームワーク|Ruby on Rails(ver 5.2.4.2)|
|マークアップ|HTML/CSS(Haml/Sass)|
|フロントエンド|JavaScript(jQuery)|
|本番環境|AWS,EC2|
|自動デプロイ|capistrano|
|画像アップロード|carrierwave,S3|
|DB|MySQL|
|ユーザー管理|devise|
|クレジットカード管理|payjp|

## users テーブル
|Column|Type|Options|
|------|----|-------|
|nickname|string|null: false index:true|
|email|string|null: false|
|password|string|null: false|
|first_name|string|null: false|
|last_name|string|null: false|
|birthday|string|null: false|
|send_first_name|string|null: false|
|send_last_name|string|null: false|
|first_name_kana|string|null: false|
|last_name_kana|string|null: false|
|send_first_name_kana|string|null: false|
|send_last_name_kana|string|null: false|

### Association
- has_many : items
- has_many : cards
- has_one : address

## images テーブル

|Column|Type|Options|
|------|----|-------|
|url|string|null: false|
|item|references|null: false, foreign_key: true|

### Association
- belongs_to : item

## addresses テーブル

|Column|Type|Options|
|------|----|-------|
|postalcode|string|null: false|
|prefecture|integer|null: false|
|city_town|string|null: false|
|house_number|string|null: false|
|building_name|string||
|phone_number|string||
|user|references|null: false, foreign_key: true|

### Association
- belongs_to : user

## items テーブル

|Column|Type|Options|
|------|----|-------|
|name|string|null: false index:true|
|text|text|null: false|
|status|integer|null: false|
|fee|integer|null: false|
|area|string|null: false|
|shipping-date|date|null: false|
|price|integer|null: false|
|user|references|null: false, foreign_key: true|
|category|references|null: false, foreign_key: true|

### Association
- belongs_to :user
- belongs_to :category
- has_many :images

## categories テーブル
|Column|Type|Options|
|------|----|-------|
|name|string|null: false index:true|
|ancestry|||

### Association
- has_many :items

## cards テーブル
|Column|Type|Options|
|------|----|-------|
|user|references|null: false, foreign_key: true|
|customer_id|string|null: false|
|card_id|string|null: false|

### Association
- belongs_to :user