# README
## users テーブル

|Column            |Type      |Options     |
|--------------    |------    |------------|
|nickname          |string    |null: false |
|email             |string    |null: false , unique: true|
|encrypted_password|string    |null: false |
|last_name         |string    |null: false |
|first_name        |string    |null: false |
|last_name_kana    |string    |null: false |
|first_name_kana   |string    |null: false |
|birth_date        |date      |null: false |

### Association
- has_many: items
- has_many: histories

## items テーブル

|Column           |Type   |Options     |
|--------------   |------ |------------|
|product_name     |string |null: false |
|category_id      |integer|null: false |
|condition_id     |integer|null: false |
|charge_id        |integer|null: false |
|area_id          |integer|null: false |
|delivery_id  |integer|null: false |
|price            |integer|null: false |
|description      |text   |null: false |
|user             |references|foreign_key: true|

### Association
- belongs_to: user
- has_one: history

## addresses テーブル

|Column           |Type       |Options          |
|--------------   |------     |------------     |
|postal_code      |string     |null: false      |
|area_id             |integer    |null: false      |
|municipalities   |string     |null: false      |
|street_num       |string     |null: false      |
|phone_num        |string     |null: false      |
|building         |string     |                 |
|history          |references |foreign_key: true|

### Association
- belongs_to: history



## histories テーブル

|Column        |Type       |Options          |
|--------------|------     |------------     |
|user          |references |foreign_key: true|
|item      |references |foreign_key: true|

### Association
- belongs_to: user
- belongs_to: item
- has_one: address