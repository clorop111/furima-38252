# テーブル設計

## users テーブル

| Column             | Type   | Options                   |
| ------------------ | ------ | ------------------------- |
| email              | string | null: false, unique: true |
| encrypted_password | string | null: false               |
| name               | string | null: false               |
| first_name_kanji   | string | null: false               |
| last_name_kanji    | string | null: false               |
| first_name_kana    | string | null: false               |
| last_name_kana     | string | null: false               |
| date_of_birth      | date   | null: false               |



### Association
- has_many :items
- has_many :records



## items テーブル



| Column             | Type       | Options      |
| ------------------ | ---------- | ------------ |
| title              | string     | null: false  |
| explanation        | text       | null: false  |
| category_id        | integer    | null: false  |
| condition_id       | integer    | null: false  |
| shipping_charge_id | integer    | null: false  |
| prefectures_id     | integer    | null: false  |
| day_id             | integer    | null: false  |
| price              | integer    | null: false  |



### Association
- belongs_to :user
- belongs_to :record



## records テーブル

| Column       | Type       | Options      |
| ------------ | ---------- | ------------ |
| item         | references | null: false, foreign_key: true |
| user         | references | null: false, foreign_key: true |



### Association
- belongs_to :user
- belongs_to :item
- belongs_one :information



## informations テーブル

| Column         | Type       | Options      |
| -------------- | ---------- | ------------ |
| post_cord      | string     | null: false  |
| prefectures_id | string     | null: false  |
| municipality   | string     | null: false  |
| address        | string     | null: false  |
| building_name  | string     |              |
| phone_number   | string     | null: false  |

### Association
- belongs_to :record