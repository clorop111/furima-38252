# テーブル設計

## users テーブル

| Column             | Type   | Options     |
| ------------------ | ------ | ----------- |
| email              | string | null: false |
| encrypted_password | string | null: false |
| name               | string | null: false |
| kanji              | string | null: false |
| kana               | string | null: false |
| date_of_birth      | date   | null: false |



### Association
- has_many :items
- has_many :records



## items テーブル



| Column          | Type       | Options      |
| --------------- | ---------- | ------------ |
| title           | string     | null: false  |
| explanation     | text       | null: false  |
| category        | integer    | null: false  |
| condition       | integer    | null: false  |
| shipping_charge | integer    | null: false  |
| prefectures     | integer    | null: false  |
| day             | integer    | null: false  |
| price           | integer    | null: false  |



### Association
- belongs_to :uses
- belongs_to :records



## records テーブル

| Column       | Type       | Options      |
| ------------ | ---------- | ------------ |
| item         | references | null: false, foreign_key: true |
| user         | references | null: false, foreign_key: true |



### Association
- belongs_to :users
- belongs_to :items



## informations テーブル

| Column        | Type       | Options      |
| ------------- | ---------- | ------------ |
| post_cord     | string     | null: false  |
| prefectures   | string     | null: false  |
| municipality  | string     | null: false  |
| address       | string     | null: false  |
| building_name | string     |              |
| phone_number  | string     | null: false  |

### Association
- belongs_to :items