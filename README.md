## テーブル設計

## usersテーブル

|Column | Type | Options |
| --- | --- | --- |
| nickname | | string | null: false |
| email | string | null: false, unique :true |
| encrypted_password | string | null: false |
| last_name | string |null: false|
| first_name | string |null: false|
| last_name_kana | string |null: false|
| first_name_kana | string |null: false|
| birthday | date | null: false |


### Association
- has_many :items
- has_many :buys

## itemsテーブル

| Column | Type | Options |
| --- | --- | --- |
| product_name | string | null: false |
| category_id | integer | null: false |
| situation_id | integer | null: false |
| pay_for_id | integer | null: false |
| area_id | integer | null: false |
| shipping_date_id | integer | null: false|
| price | integer | null: false |
| buys | references | null: false |
| user | references | null: false,foreign_key: true |

### Association
- belongs_to :user
- has_one :buy

## buysテーブル
| Column | Type | Options | 
| --- | --- | --- |
| items | references | null: false,foreign_key: true |
| users | references | null: false ,foreign_key: true |

### Association
- has_many :users
- belongs_to :item

## shipping_addressテーブル
|Column | Type | Options |
| --- | --- | --- |
| postal_code | integer | null: false |
| prefectures | integer | null: false |
| municipalities | string | null: false |
| address | string | null: false |
| building | string |
| telephone_number | integer | null: false |
| user | references | null: false,foreign_key: true |

### Association
- has_one :buy
- has_one :user