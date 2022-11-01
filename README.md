# テーブル設計

## users テーブル

| Column             | Type   | Options     |
| ------------------ | ------ | ----------- |
| email              | string | null: false |
| encrypted_password | string | null: false |
| name               | string | null: false |
| date_of_birth      | string | null: false |


## items テーブル

| Column          | Type       | Options      |
| --------------- | ---------- | ------------ |
| title           | string     | null: false  |
| explanation     | text       | null: false  |
| category        | string     | null: false  |
| condition       | string     | null: false  |
| shipping_charge | string     | null: false  |
| sender          | string     | null: false  |
| day             | string     | null: false  |
| price           | integer    | null: false  |



## records テーブル

| Column      | Type       | Options      |
| ----------- | ---------- | ------------ |
| name        | string     | null: false  |
| title       | string     | null: false  |

## informations テーブル

| Column        | Type       | Options      |
| ------------- | ---------- | ------------ |
| post_cord     | string     | null: false  |
| prefectures   | string     | null: false  |
| municipality  | string     | null: false  |
| address       | string     | null: false  |
| building_name | string     |              |
| phone_number  | string     | null: false  |