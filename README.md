## テーブル設計

## usersテーブル

|Column | Type | Options |
| --- | --- | --- |
| nickname | | string | NOT NULL|
| email | string | NOT NULL, ユニーク制約|
| encrypted_password | string | NOT NULL |
| name | string |NOT NULL|
| birthday | date | NOT NULL |


### Association
- has_many :users_items
- has_many :users_buys

## itemsテーブル

| Column | Type | Options |
| --- | --- | --- |
| product name | string | NOT NULL |
| category | string | NOT NULL |
| situation | string | NOT NULL |
| area | string | NOT NULL |
| shipping date | date | NOT NULL|
| price |  integer | NOT NULL |
| comments | text | 
| buys | references | NOT NULL,外部キー |
| user | references | NOT NULL,外部キー |

### Association
- belongs_to :users
- has_one :buys

## buysテーブル
| Column | Type | Options | 
| --- | --- | --- |
| items | references | NOT NULL,外部キー |
| users | references | NOT NULL ,外部キー |
| comments | text | 

### Association
- has_many :users
- belongs_to :items

