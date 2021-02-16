# テーブル設計

## usersテーブル

| Column             | Type       | Option                    |
| ------------------ | ---------- | ------------------------- |
| nickname           | string     | null :false               |
| email              | string     | null :false, unique: true |
| encrypted_password | string     | null :false               |
| family_name        | string     | null :false               |
| first_name         | string     | null :false               |
| family_name_kana   | string     | null :false               |
| first_name_kana    | string     | null :false               |
| birthday           | date       | null :false               |

### Association

- has_many :products
- has_many :purchases

## productsテーブル

| Column           | Type       | Option            |
| ---------------- | ---------- | ----------------- |
| name             | string     | null :false       |
| description      | text       | null :false       |
| price            | integer    | null :false       |
| category_id      | integer    | null :false       |
| status_id        | integer    | null :false       |
| cost_id          | integer    | null :false       |
| state_id         | integer    | null :false       |
| date_id          | integer    | null :false       |
| user             | references | foreign_key: true |

### Association

- belongs_to :user
- has_one :purchase

## buyersテーブル

| Column           | Type       | Option            |
| ---------------- | ---------- | ----------------- |
| postal_code      | string     | null :false       |
| state_id         | integer    | null :false       |
| city             | string     | null :false       |
| address          | string     | null :false       |
| building         | string     |                   |
| phone_num        | string     | null :false       |
| user             | references | foreign_key: true |

### Association

- belongs_to :purchase

## purchasesテーブル

| Column           | Type       | Option            |
| ---------------- | ---------- | ----------------- |
| product          | references | foreign_key: true |
| user             | references | foreign_key: true |

### Association

- belongs_to :user
- belongs_to :product
- has_one :buyer

