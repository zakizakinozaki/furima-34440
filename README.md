# テーブル設計

## usersテーブル

| Column           | Type       | Option       |
| ---------------- | ---------- | ------------ |
| nickname         | string     | null :false  |
| email            | string     | unique: true |
| password         | string     | null :false  |
| family_name      | string     | null :false  |
| first_name       | string     | null :false  |
| family_name_kana | string     | null :false  |
| first_name_kana  | string     | null :false  |
| birthday         | date       | null :false  |

### Association

- has_many :products
- has_one :buyer

## productsテーブル

| Column           | Type       | Option            |
| ---------------- | ---------- | ----------------- |
| name             | string     | null :false       |
| description      | text       | null :false       |
| category         | text       | null :false       |
| status           | text       | null :false       |
| cost             | text       | null :false       |
| ship_from        | text       | null :false       |
| ship_date        | integer    | null :false       |
| user             | references | foreign_key: true |

### Association

- belongs_to :user
- has_one :purchase

## buyersテーブル

| Column           | Type       | Option            |
| ---------------- | ---------- | ----------------- |
| postal_code      | string     | null :false       |
| state            | string     | null :false       |
| city             | string     | null :false       |
| address          | string     | null :false       |
| building         | string     |                   |
| phone_num        | string     | null :false       |
| user             | references | foreign_key: true |

### Association

- belongs_to :user
- has_one :purchase

## purchasesテーブル

| Column           | Type       | Option            |
| ---------------- | ---------- | ----------------- |
| product          | references | foreign_key: true |
| buyer            | references | foreign_key: true |

### Association

- belongs_to :product
- belongs_to :buyer

