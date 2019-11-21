# README

This README would normally document whatever steps are necessary to get the
application up and running.

Things you may want to cover:

* Ruby version

* System dependencies

* Configuration

* Database creation

* Database initialization

* How to run the test suite

* Services (job queues, cache servers, search engines, etc.)

* Deployment instructions

* ...


# merukari DB設計

## Usersテーブル
|Column|Type|Options|
|------|----|-------|
|nickname|string|null: false|     
|email|string|null: false, unique: true|
|password|string|null: false|
|first_name|string|null: false|
|last_name|string|null: false|
|first_name_kana|string|null: false|
|last_name_kana|string|null: false|
|birthday|string|null: false|
|phone_number|string|null: false|
### Association
- has_ones :address
- has_many :item_comments
- has_many :sns_credentials,dependent::destroy
- has_many :items,dependent::destroy


## Addressesテーブル
|Column|Type|Options|
|------|----|-------|
|user_id|references|null: false, foreign_key: true|
|post_number|string|null: false|
|prefecture_id|references|null: false, foreign_key: true|
|city|string|null: false|
|address|string|null: false|
|building|string|
### Association
- 

## Cardsテーブル
|Column|Type|Options|
|------|----|-------|
|user_id|references|null: false, foreign_key: true|
|card_number|string|null: false|
|expiration_date_year|integer|null: false|
|expiration_date_month|string|null: false|
|security_code|integer|null: false|

### Association
- belongs_to :user
- belongs_to :group

## Sns_credentialsテーブル
|Column|Type|Options|
|------|----|-------|
|user_id|references|null: false, foreign_key: true|
|uid|string||
|provider|string||

## Itemsテーブル
|Column|Type|Options|
|------|----|-------|
|name|string|null: false|
|description|text|null: false|
|condition_id|references|null: false, foreign_key: true|
|user_id|references|null: false, foreign_key: true|
|postage_id|references|null: false, foreign_key: true|
|delivery_method_id|references|null: false, foreign_key: true|
|prefecture_id|references|null: false, foreign_key: true|
|delivery_day_id|references|null: false, foreign_key: true|
|price|integer|null: false|
|brand_sub_id|references|null: false, foreign_key: true|
|likes_count|integer|default: 0|
|category_sub2_id|references|null: false, foreign_key: true|
|profit_id|references|null: false, foreign_key: true|
|size_id|references|null: false, foreign_key: true|

### Association
- belongs_to :group
- belongs_to :user

## Category_mainsテーブル
|Column|Type|Options|
|------|----|-------|
|name|string|null: false|

## Category_sub1sテーブル
|Column|Type|Options|
|------|----|-------|
|name|string|null: false|
|category_main_id|references|null: false, foreign_key: true|

## Category_sub2sテーブル
|Column|Type|Options|
|------|----|-------|
|name|string|null: false|
|category_sub1_id|references|null: false, foreign_key: true|

## Ratesテーブル
|Column|Type|Options|
|------|----|-------|
|rate|integer|
|user_id|references|null: false, foreign_key: true|
|transaction_id|references|null: false, foreign_key: true|

## Likesテーブル
|Column|Type|Options|
|------|----|-------|
|user_id|references|null: false, foreign_key: true|
|item_id|references|null: false, foreign_key: true|

## Delivery_methodsテーブル
|Column|Type|Options|
|------|----|-------|
|method|string|null: false|


## Postagesテーブル
|Column|Type|Options|
|------|----|-------|
|postage|string|null: false|

## Brand_mainテーブル
|Column|Type|Options|
|------|----|-------|
|name|string|null: false|

## Brand_subテーブル
|Column|Type|Options|
|------|----|-------|
|name|string|null: false|
|brand_main_id|references|null: false, foreign_key: true|


## Imagesテーブル
|Column|Type|Options|
|------|----|-------|
|item_id|references|null: false, foreign_key: true|
|image|string|null: false|

## Profitsテーブル
|Column|Type|Options|
|------|----|-------|
|profit|integer|null: false|
|delivery_cost|integer|null: false|

## Delivery_daysテーブル
|Column|Type|Options|
|------|----|-------|
|days|string|null: false|

## Sizesテーブル
|Column|Type|Options|
|------|----|-------|
|size|string|null: false|

## Prefecturesテーブル
|Column|Type|Options|
|------|----|-------|
|prefecture|string||

## Transactionsテーブル
|Column|Type|Options|
|------|----|-------|
|item_id|references|null: false, foreign_key: true|
|seller_id|references|null: false, foreign_key: {to_table: :users}|
|buyer_id|references|foreign_key: {to_table: :users}|
|transaction_state_id|references|null: false, foreign_key: true|

## Transaction_statesテーブル
|Column|Type|Options|
|------|----|-------|
|state|string|null: false|

## Transaction_commentsテーブル
|Column|Type|Options|
|------|----|-------|
|user_id|references|null: false, foreign_key: true|
|transaction_id|references|null: false, foreign_key: true|
|comment|text|null: false|















