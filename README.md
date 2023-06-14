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

# アプリケーション名
  エクササイズアプリ
# アプリケーション概要
  トップページに自分のIDと生年月日を入力することで、セラピストが指導したエクササイズをスマートフォンから確認ができます。
# URL
  https://exercise-app-8uz0.onrender.com
# テスト用アカウント
  ID：任意の半角数字(例：123456)  生年月日：19990101
# 利用方法
  ## エクササイズの閲覧(患者サイド)
    1.QRコードを読み取り、ログインページに遷移
    2.ログインページにIDと生年月日8桁を入力
    3.自身が指導されたExの動画一覧が表示される
  ## エクササイズの登録(PTサイド)
    1.トップページにユーザーのIDを入力し新規登録
    2-1.新規登録ページへ遷移し、生年月日の登録と指導したExの動画を登録
    2-2.一覧ページのQRコードを発行する
# アプリ作成の背景
  現在では、指導したExの実施方法は静止画像に説明文を記載した資料を印刷して配布しています。しかし、プリントであるため紛失や、詳細な方法が不明瞭な部分もあります。また、患者様から動画での提供があると良いといった声も上がっているため、このようなアプリの作成に至りました。
# 要件定義
  https://docs.google.com/spreadsheets/d/1d1kUHbnvnzWSOyq1VvDRb0dHV5MaZMY01s-ekDHdB94/edit#gid=982722306
# 実装した機能についての画像・GIF
  ![Image from Gyazo](https://i.gyazo.com/d7aa06393b0c6a9423f71f5a0de9f123.gif)
  ![Image from Gyazo](https://i.gyazo.com/d5f86ca317c3ed2ff451e4da74632220.gif)
  ![Image from Gyazo](https://i.gyazo.com/2f8f211796d8884e7ba04879f1d01440.gif)


# データベース設計
  ## usersテーブル
  | Column     | Type       | Options                        |
  | ---------- | ---------- | ------------------------------ |
  | patient_id | string     | null: false, unique: true      |
  | birth_day  | string     | null: false                    |

  ### Association
  - has_many :exercises

  ## exercisesテーブル
  | Column     | Type       | Options                        |
  | ---------- | ---------- | ------------------------------ |
  | user       | references | null: false, foreign_key: true |
  | url1       | text       | null: false                    |
  | url2       | text       |                                |
  | url3       | text       |                                |
  | url4       | text       |                                |

  ### Association
  - belongs_to :user

# ER図
  ![Image from Gyazo](https://i.gyazo.com/c62891b5b0b6feee48364d467517889d.png)
# 画面遷移図
  ![Image from Gyazo](https://i.gyazo.com/1f6990e2cdf778430eb00295bbdd2464.png)

# 開発環境
  ruby on rails / HTML/CSS / javascript 

# 工夫したポイント
  * deviseを用いてユーザー管理機能の実装をしているが、登録内容の変更を行った
  * エクササイズの選択画面で、カーソルを当てると、プレビューが可能になる点
  * 動画をデータベースで保存せずにYouTubeのURLを用いたこと
  * 一覧URLをQRコードに変換する機能をつけたこと
  * 医療機関での使用を目的としているが、現在の仕様ではサーバー等の問題で運用不可のため改善が必要

