## アプリ概要
誰でも簡単に日々の運動を記録、投稿できるアプリケーションを作成しました。

## 目指した課題解決
日々の運動を習慣化するために作成しました。
投稿することにより周りとつながり習慣化を目的としています。

## アプリイメージ
トップページ
[![Image from Gyazo](https://i.gyazo.com/22e5f6c902688efe3ccfa9677706a8cc.jpg)](https://gyazo.com/22e5f6c902688efe3ccfa9677706a8cc)
新規登録機能
[![Image from Gyazo](https://i.gyazo.com/0b504bd709949341a10ce1fed6386017.png)](https://gyazo.com/0b504bd709949341a10ce1fed6386017)
ログイン機能
[![Image from Gyazo](https://i.gyazo.com/c5b7152e6e3a483c32c90b01e77497e9.png)](https://gyazo.com/c5b7152e6e3a483c32c90b01e77497e9)
投稿ページ
[![Image from Gyazo](https://i.gyazo.com/f8c646315f1f5e6e84323a8d392ee565.png)](https://gyazo.com/f8c646315f1f5e6e84323a8d392ee565)
メインページ
[![Image from Gyazo](https://i.gyazo.com/ea78c980edb86746ddd03deca778089e.png)](https://gyazo.com/ea78c980edb86746ddd03deca778089e)
コメント機能
[![Image from Gyazo](https://i.gyazo.com/5a98bcd72831ca6202b4b5a28d32396f.png)](https://gyazo.com/5a98bcd72831ca6202b4b5a28d32396f)
## URL
https://habits-app-91-33539.herokuapp.com/

## 機能
・ユーザー登録機能
・ログイン・ログアウト機能
・コメント機能
・投稿機能
・マイページ機能
・投稿編集機能
・投稿削除機能

## 使用技術
・Ruby 2.6.5
・Ruby on Rails 6.0.0
・mysql0.5.3
・HTML/CSS

## 今後実装予定の機能
・いいね機能
・レイアウトの修正

## ER図
[![Image from Gyazo](https://i.gyazo.com/84d9ac52b50c4b41d8db86daf172b850.png)](https://gyazo.com/84d9ac52b50c4b41d8db86daf172b850)

## DB設計

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
