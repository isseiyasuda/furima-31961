# README
## user テーブル

|Column            |Type      |Options     |
|--------------    |------    |------------|
|nickname          |string    |null: false |
|email             |string    |null: false , unique: true|
|encrypted_password|string    |null: false |
|last_name         |string    |null: false |
|first_name        |string    |null: false |
|last_name-kana    |string    |null: false |
|first_name-kana   |string    |null: false |
|birth_date        |date      |null: false |

### Association
- has_many: displays
- has_many: histories

## display テーブル

|Column           |Type   |Options     |
|--------------   |------ |------------|
|product_name     |string |null: false |
|category_id      |integer|null: false |
|condition_id     |integer|null: false |
|charges_id       |integer|null: false |
|area_id          |integer|null: false |
|days_id          |integer|null: false |
|price            |string |null: false |

### Association
- belongs_to: user
- has_one: history

## address テーブル

|Column           |Type   |Options          |
|--------------   |------ |------------     |
|postal_code      |string |null: false      |
|prefecture       |integer|null: false      |
|municipalities   |string |null: false      |
|street_num       |string |null: false      |
|phone_num        |string |null: false      |
|building         |string |                 |
|history_id       |index  |foreign_key: true|

### Association
- belongs_to: history



## history テーブル

|Column        |Type  |Options          |
|--------------|------|------------     |
|user_id       |index |foreign_key: true|
|display_id    |index |foreign_key: true|

### Association
-belongs_to: user
-belongs_to: display