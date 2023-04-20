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
# テスト用アカウント
  ID：5012345  生年月日：19990101
# 利用方法
  ## エクササイズの閲覧(患者サイド)
    1.トップページからログインページに遷移
    2.ログインページにIDと生年月日8桁を入力
    3.自身が指導されたExの動画一覧が表示される
  ## エクササイズの登録(PTサイド)
    1.トップページにユーザーのIDを入力し新規登録もしくは編集ボタンをクリック
    2-1.新規登録ページへ遷移し、生年月日の登録と指導したExの動画を登録
    2-2.編集ページへ遷移し、過去に登録したExの編集を行う
# アプリ作成の背景
  現在では、指導したExの実施方法は静止画像に説明文を記載した資料を印刷して配布しています。しかし、プリントであるため紛失や、詳細な方法が不明瞭な部分もあります。また、患者様から動画での提供があると良いといった声も上がっているため、このようなアプリの作成に至りました。
# 要件定義
  https://docs.google.com/spreadsheets/d/1d1kUHbnvnzWSOyq1VvDRb0dHV5MaZMY01s-ekDHdB94/edit#gid=982722306
# 実装した機能についての画像・GIF
# 実装予定の機能
# データベース設計
  ## usersテーブル
  | Column     | Type       | Options                        |
  | ---------- | ---------- | ------------------------------ |
  | patient_id | string     | null: false, unique: true      |
  | birth_day  | date       | null: false                    |

  ### Association
  - has_many :exercises

  ## exercisesテーブル
  | Column     | Type       | Options                        |
  | ---------- | ---------- | ------------------------------ |
  | user       | references | null: false, foreign_key: true |
  | exercise   | text       | null: false                    |

  ### Association
  - belongs_to :user

# ER図
  https://user-images.githubusercontent.com/121847812/233317527-3af88056-7aef-4a66-97fb-c9693ff9fbbc.png
# 画面遷移図
# 開発環境
  ruby on rails / HTML/CSS / javascript 
# 工夫したポイント

