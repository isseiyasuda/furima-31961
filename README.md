# README
## user テーブル

|Column        |Type  |Options     |
|--------------|------|------------|
|nickname      |string|null: false |
|email         |string|null: false |
|password      |string|null: false |
|last_name     |string|null: false |
|first_name    |string|null: false |
|furigana_last |string|null: false |
|furigana_first|string|null: false |
|birth_year    |string|null: false |
|birth_month   |string|null: false |
|birth_day     |string|null: false |

### Association
- has_many: displays
- has_many: purchases

## display テーブル

|Column        |Type  |Options     |
|--------------|------|------------|
|image         |string|null: false |
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

## purchase テーブル

|Column        |Type  |Options     |
|--------------|------|------------|
|postal_code   |string|null: false |
|prefecture    |string|null: false |
|municipalities|string|null: false |
|address       |string|null: false |
|phone_num     |string|null: false |
|building      |string|null: false |
|credit_num    |string|null: false |
|expiration    |string|null: false |
|security      |string|null: false |

### Association
-belongs_to: user
-belongs_to: display