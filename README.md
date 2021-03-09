# README

# テーブル設計

## users テーブル

| Column              | Type    | Options     |
| ------------------- | --------| ----------- |
| nickname            | string  | null: false |
| email               | string  | unique: true|
| encrypted_password  | string  | null: false |
| family_name         | string  | null: false |
| first_name          | string  | null: false |
| family_name_kana    | string  | null: false |
| first_name_kana     | string  | null: false |
| birthday            | date    | null: false |

### Association

- has_many :items
- has_many :purchase


## items テーブル

| Column          | Type       | Options              |
| --------------- | ---------- | ---------------------|
| name            | string     | null: false          |
| description     | text       | null: false          |
| category        | integer    | null: false          |
| status          | integer    | null: false          |
| shipping_charge | integer    | null: false          |
| shipping_area   | integer    | null: false          |
| days_to_ship    | integer    | null: false          |
| price           | integer    | null: false          |
| user            | references | foreign_key: true    |

### Association

- belong to :user
- has_one   :purchases


## purchases テーブル

| Column       | Type       | Options            |
| ------------ | ---------- | ------------------ |
| item         | references |  foreign_key: true |
| user         | references |  foreign_key: true |


### Association

- belongs_to :item
- belongs_to :user
- has_one    :shipping_address


## shipping_addresses テーブル

| Column        | Type       | Options           |
| ------------- | ---------- | ------------------|
| post_core     | string     | null: false       |
| prefecture_id | string     | null: false       |
| city          | string     | null: false       |
| address       | string     | null: false       |
| building      | string     |                   |
| phone_num     | string     | null: false       |
| purchase      | references | foreign_key: true |


### Association

- belong to :purchase