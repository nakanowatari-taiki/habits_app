## users テーブル

| Column           | Type   | Options     |
| ---------------- | ------ | ----------- |
| nickname         | string | null: false |
| email            | string | null: false |
|encrypted_password| string | null: false |

### Association

- has_many :plans
- has_many :comments

## plans テーブル

| Column   | Type      | Options     |
| -------- | --------- | ----------- |
| date     | date      | null: false |
| text     |  text     | null: false | 
| user     |references | null: false,foreign_key: true |
| part_id  | integer   | null: false |
### Association

- belongs_to :user
- belongs_to :part
- has_many   :comments

## comments テーブル
 
| Column   | Type      | 
| -------- | --------- |
| com      | text      | 
| user_id  | integer   |
| plan_id  | integer   |

### Association
- belongs_to :user
- belongs_to :plan
