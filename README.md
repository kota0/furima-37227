## テーブル設計

## usersテーブル

|Column | Type | Options |
| --- | --- | --- |
| nickname | string | null: false |
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
| shipping_date_id | integer | null: false |
| price | integer | null: false |
| description_of_item | text | null: false |
| user | references | null: false,foreign_key: true |

### Association
- belongs_to :user
- has_one :buy

## buysテーブル
| Column | Type | Options | 
| --- | --- | --- |
| item | references | null: false,foreign_key: true |
| user | references | null: false ,foreign_key: true |

### Association
- belongs_to :user
- belongs_to :item
- has_one :shipping_address

## shipping_addressesテーブル
|Column | Type | Options |
| --- | --- | --- |
| postal_code | string | null: false |
| address | string | null: false |
| area_id | integer | null: false |
| city | string | null: false |
| building | string |
| telephone_number | string | null: false |
| buy | references | null: false,foreign_key: true |

### Association
- belongs_to :buy
