# README
## user テーブル

|Column         |Type      |Options     |
|-------------- |------    |------------|
|nickname       |string    |null: false |
|email          |string    |null: false |
|password       |string    |null: false |
|last-name      |string    |null: false |
|first-name     |string    |null: false |
|last-name-kana |string    |null: false |
|first-name-kana|string    |null: false |
|birth_date     |datetime  |null: false |

### Association
- has_many: displays
- has_many: purchases
- has_many: history

## display テーブル

|Column        |Type  |Options     |
|--------------|------|------------|
|product_name  |string|null: false |
|category      |string|null: false |
|condition     |string|null: false |
|charges       |string|null: false |
|area          |string|null: false |
|days          |string|null: false |
|price         |string|null: false |

### Association
- belongs_to: user
- belongs_to: purchase
- belongs_to: history

## purchase テーブル

|Column        |Type  |Options     |
|--------------|------|------------|
|postal_code   |string|null: false |
|prefecture    |string|null: false |
|municipalities|string|null: false |
|address       |string|null: false |
|phone_num     |string|null: false |
|building      |string|null: false |


### Association
-belongs_to: user
-belongs_to: display

## history テーブル

|Column        |Type  |Options     |
|--------------|------|------------|
|user_id       |      |            |
|display_id    |      |            |

### Association
-belongs_to: user
-belongs_to: display