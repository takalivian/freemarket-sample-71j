## usersテーブル
|Column|Type|Options|
|------|----|-------|
|name|string|null:false index:true|
|pass|integer|null: false|
|mail|string|null: false|

### Association
- has_many : groups, through: :groups_users
- has_many : groups_users
- has_many : messages


## messagesテーブル
|Column|Type|Options|
|------|----|-------|
|text|text||
|image|text||
|user|references|null: false, foreign_key: true|
|group|references|null: false, foreign_key: true|

### Association
- belongs_to :user
- belongs_to :group


## groupsテーブル
|Column|Type|Options|
|------|----|-------|
|name|string|null: false|

### Association
- has_many : users, through: :groups_users
- has_many : groups_users
- has_many : messages



## groups_usersテーブル
|Column|Type|Options|
|------|----|-------|
|user|references|null: false, foreign_key: true|
|group|references|null: false, foreign_key: true|

### Association
- belongs_to :group
- belongs_to :user