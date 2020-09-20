# コードレビュートレーニング用リポジトリその1

`このリポジトリでは、一般的なコードレビューのトレーニングをしていただきます。`

## 実施方法
1.　こちらのリポジトリをクローンしてください。

2.　クローンしてきたファイルのディレクトリに移動し、rm -rf .gitを実行してください。

3.　ご自身のgithubのページに移動し、「New repository」よりリモートリポジトリを作成してください。

4.　クローンしてきたファイルのディレクトリにて、順に以下のコマンドを実行してください。
- git init
- git add -A
- git commit -m "first commit"
- git remote add origin 先ほど作ったリポジトリのURL
- git push -u origin master

5.　下記issueを作成しましょう。
- issue1 モデルのコードレビュー
- issue2 コントローラのコードレビュー
- issue3 ビューのコードレビュー

6. ブランチを作成して作業開始です。作業は、レビューではなく、自分ならここを指摘すると行ったコードを本来の形に戻してください。
作業が完了したらPRを作成し、先輩レビュアーメンターに提出してください。

---

# テーブル設計

## users テーブル

| Column   | Type   | Options     |
| -------- | ------ | ----------- |
| name     | string | null: false |
| email    | string | null: false |
| password | string | null: false |

### Association
- has_many :room_users
- has_many :rooms, through: room_users
- has_many :messages

## rooms テーブル

| Column | Type   | Options     |
| ------ | ------ | ----------- |
| name  | string | null: false |

### Association
- has_many :room_users
- has_many :users, through: room_users
- has_many :messages

## room_users テーブル

| Column  | Type    | Options                        |
| ------- | ------- | ------------------------------ |
| user_id | integer | null: false, foreign_key: true |
| room_id | integer | null: false, foreign_key: true |

### Association

- belongs_to :room
- belongs_to :user

## messages テーブル

| Column  | Type    | Options                        |
| ------- |  ------- | ------------------------------ |
| text    | string  |
| user_id | integer | null: false, foreign_key: true |
| room_id | integer | null: false, foreign_key: true |

### Association

- belongs_to :room
- belongs_to :user
