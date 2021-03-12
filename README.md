# README

This README would normally document whatever steps are necessary to get the
application up and running.

Things you may want to cover:

* Ruby version

* System dependencies

* Configuration

* Database creation

* Database initialization

* How to run the test suite

* Services (job queues, cache servers, search engines, etc.)

* Deployment instructions

* ...


## users テーブル

| Column             | type   | option                    |
| -------------------|--------|---------------------------|
| nickname           | string | null: false               |
| email              | string | null: false  unique:true  |
| password           | string | null: false               |
| encrypted_password | string | null: false               |
| family_name        | string | null: false               |
| given_name         | string | null: false               |
| family_name_kana   | string | null: false               |
| given_name_kana    | string | null: false               |
| birthday           | date   | null: false               |

has_many:items
has_one:buyer

## items テーブル

| Column             | type          | option                         |
| -------------------|---------------|--------------------------------|
| name               | string        | null: false                    |
| description        | text          | null: false                    |
| category_id        | integer       | null: false                    |
| item_status_id     | integer       | null: false                    |
| shipping_charge_id | integer       | null: false                    |
| shipping_area_id   | integer       | null: false                    |
| shipping_date_id   | integer       | null: false                    |
| selling_price      | integer       | null: false                    |
| user               | references    | null: false  foreign_key: true |

belongs_to:user
has_one:buyer

## orders テーブル

| Column           | type       | option            |
| -----------------|------------|-------------------|
| postal_code      | string     | null: false       |
| shipping_area_id | integer    | null: false       |
| city             | string     | null: false       |
| address          | string     | null: false       |
| building_name    | string     |                   |
| phone_number     | string     | null: false       |
| buyers_id        | references | foreign_key: true |

has_one:buyer

## buyers テーブル
| Column  | type       | option            |
| --------|------------|-------------------|
| user_id | references | foreign_key: true |
| item_id | references | foreign_key: true |

belongs_to:user
belongs_to:item
has_one:order

