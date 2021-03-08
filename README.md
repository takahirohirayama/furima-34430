# README

# テーブル設計

## users テーブル

| Column    | Type    | Options     |
| --------- | --------| ----------- |
| nickname  | string  | null: false |
| email     | string  | null: false |
| password  | string  | null: false |
| name      | string  | null: false |
| name_kana | string  | null: false |
| birthday  | numeric | null: false |

### Association

- has_many :items
- has_many :purchases


## items テーブル

| Column   | Type       | Options              |
| -------- | ---------- | ---------------------|
| name     | string     | null: false          |
| image    |            | ActiveStorageで実装   |
| price    | numeric    | null: false          |
| user     | references | foreign_key: true    |

### Association

- belong to :user
- has_one   :purchases


## purchases テーブル

| Column       | Type       | Options            |
| ------------ | ---------- | ------------------ |
| card_num     | numeric    | null: false        |
| exp_month    | numeric    | null: false        |
| exp_year     | numeric    | null: false        |
| security_cord| numeric    | null: false        |
| item         | references |  foreign_key: true |
| user         | references |  foreign_key: true |


### Association

- belongs_to :item
- belongs_to :user
- has_one    :shipping_address


## shipping_addresses テーブル

| Column     | Type       | Options           |
| --------   | ---------- | ------------------|
| post_core  | text       | null: false       |
| prefecture | text       | null: false       |
| city       | text       | null: false       |
| address    | text       | null: false       |
| building   | text       |                   |
| phone_num  | numeric    | null: false       |
| purchase   | references | foreign_key: true |


### Association

- belong to :purchase