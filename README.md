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
- has_many :rates
- has_many :likes
- has_many :items, dependent: :destroy
- has_many :transaction_comments, dependent: :destroy
- has_one :address
- has_one :cards
- has_one :sns_credentials, dependent: :destroy


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
- belongs_to :user
- belongs_to :prefecture

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

## Sns_credentialsテーブル
|Column|Type|Options|
|------|----|-------|
|user_id|references|null: false, foreign_key: true|
|uid|string||
|provider|string||
### Association
- belongs_to :user

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
|category_id|references|null: false, foreign_key: true|
|profit_id|references|null: false, foreign_key: true|
|size_id|references|null: false, foreign_key: true|
|brand|string||
### Association
- belongs_to :brand_sub
- belongs_to :postage
- belongs_to :delivery_method
- belongs_to :category, dependent: :destroy
- belongs_to :prefecture
- has_many :images, dependent: :destroy
- belongs_to :profit
- belongs_to :delivery_day
- belongs_to :user
- belongs_to :size
- has_many :likes, dependent: :destroy
- has_one :transaction, dependent: :destroy
- belongs_to :condition

## Categorysテーブル
|Column|Type|Options|
|------|----|-------|
|name|string|null: false|
|ancestry|string|null: false|
### Association
- has_many :items



## Ratesテーブル
|Column|Type|Options|
|------|----|-------|
|rate|integer|
|user_id|references|null: false, foreign_key: true|
|transaction_id|references|null: false, foreign_key: true|
### Association
- belongs_to :user
- belongs_to :transaction

## Likesテーブル
|Column|Type|Options|
|------|----|-------|
|user_id|references|null: false, foreign_key: true|
|item_id|references|null: false, foreign_key: true|
### Association
- belongs_to :user
- belongs_to :item

## Delivery_methodsテーブル
|Column|Type|Options|
|------|----|-------|
|method|string|null: false, unique: true|
### Association
- has_many :items


## Postagesテーブル
|Column|Type|Options|
|------|----|-------|
|postage|string|null: false|
### Association
- has_many :items

## Brand_mainsテーブル
|Column|Type|Options|
|------|----|-------|
|name|string|null: false, unique: true|
### Association
- has_many :brand_subs

## Brand_subsテーブル
|Column|Type|Options|
|------|----|-------|
|name|string|null: false, unique: true|
|brand_main_id|references|null: false, foreign_key: true|
### Association
- belongs_to :brand_main
- has_many :items

## Imagesテーブル
|Column|Type|Options|
|------|----|-------|
|item_id|references|null: false, foreign_key: true|
|image|string|null: false|
### Association
- belongs_to :item

## Profitsテーブル
|Column|Type|Options|
|------|----|-------|
|profit|integer|null: false|
|delivery_cost|integer|null: false|
### Association
- has_many :items

## Delivery_daysテーブル
|Column|Type|Options|
|------|----|-------|
|days|string|null: false, unique: true|
### Association
- has_many :items

## Sizesテーブル
|Column|Type|Options|
|------|----|-------|
|size|string|null: false, unique: true|
### Association
- has_many :items

## Prefecturesテーブル
|Column|Type|Options|
|------|----|-------|
|prefecture|string||
### Association
- has_many :addresses
- has_many :items

## Transactionsテーブル
|Column|Type|Options|
|------|----|-------|
|item_id|references|null: false, foreign_key: true|
|seller_id|references|null: false, foreign_key: {to_table: :users}|
|buyer_id|references|foreign_key: {to_table: :users}|
|transaction_state_id|references|null: false, foreign_key: true|
### Association
- belongs_to :item
- belongs_to :transaction_state
- belongs_to :transaction_comment
- has_one :rates

## Transaction_statesテーブル
|Column|Type|Options|
|------|----|-------|
|state|string|null: false|
### Association
- has_many :transactions

## Transaction_commentsテーブル
|Column|Type|Options|
|------|----|-------|
|user_id|references|null: false, foreign_key: true|
|transaction_id|references|null: false, foreign_key: true|
|comment|text|null: false|
### Association
- belongs_to :transactions
- belongs_to :user

## Conditionsテーブル
|Column|Type|Options|
|------|----|-------|
|condition|string|null: false|
### Association
- has_many :items














