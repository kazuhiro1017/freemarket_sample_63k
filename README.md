# README

## usersテーブル

|Column      |Type   |Options |
|------------|-------|--------|
|nickname    |string |null: false|
|mail        |string |null: false, unique: true|
|password    |string |null: false|
|last_name   |string |null: false|
|first_name  |string |null: false|
|last_name   |string |null: false|
|first_name  |string |null: false|
|birthday    |string |null: false|
|phone_number|string |null: false|

### Association
- has_many :groups_users
- has_many :posts
- has_many :groups, through: :groups_users


## productsテーブル

|Column  |Type   |Options |
|--------|-------|--------|
|user_id    |string |null: false|
|product |string |null: false|
|user_id    |string |null: false|
|user_id    |string |null: false|
|user_id    |string |null: false|
|user_id    |string |null: false|


### Association
- has_many :groups_users
- has_many :posts
- has_many :groups, through: :groups_users


## comentsテーブル
|Column  |Type   |Options |
|--------|-------|--------|
|message |text   ||
|image   |text   ||
|user_id |integer|null: false, foreign_key: true|
|group_id|integer|null: false, foreign_key: true|

### Association
- belongs_to :user
- belongs_to :group


## comentsテーブル

|Column    |Type   |Options |
|----------|-------|--------|
|coment    |string |null: false|
|user_id   |integer|null: false, foreign_key: true|
|product_id|integer|null: false, foreign_key: true|

### Association
- belongs_to :group
- belongs_to :user

