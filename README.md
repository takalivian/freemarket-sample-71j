## users テーブル
|Column|Type|Options|
|------|----|-------|
|nickname|string|null: false index:true|
|email|string|null: false|
|password|string|null: false|
|firstname|string|null: false|
|lastname|string|null: false|
|furigana-firstname|string|null: false|
|furigana-lastname|string|null: false|
|birthday|integer|null: false|
|send-firstname|string|null: false|
|send-lastname|string|null: false|
|send-furigana-firstname|string|null: false|
|send-furigana-lastname|string|null: false|
|postalcode|integer|null: false|
|prefecture|string|null: false|
|municipality|string|null: false|
|address|string|null: false|
|item|references|null: false, foreign_key: true|


### Association
- has_many : items





## images テーブル

|Column|Type|Options|
|------|----|-------|
|url|integer|null: false|
|item_id|references|null: false, foreign_key: true|

### Association
- belongs_to : item



## items テーブル

|Column|Type|Options|
|------|----|-------|
|name|string|null: false index:true|
|text|text|null: false|
|status|string|null: false|
|fee|integer|null: false|
|area|string|null: false|
|shipping-date|date|null: false|
|price|integer|null: false|
|image|references|null: false, foreign_key: true|
|user|references|null: false, foreign_key: true|

### Association
- belongs_to :user
- belongs_to :category
- has_many :images






## categories テーブル
|Column|Type|Options|
|------|----|-------|
|genre|string|null: false index:true|
|subgenre|string|null: false index:true|
|detail|string|null: false index:true|

### Association
- has_many :items