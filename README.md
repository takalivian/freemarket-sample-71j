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
|municipality|string|null: false|

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