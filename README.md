## postsテーブル

| Column     | Type       | Options                        |
| ---------- | ---------- | ------------------------------ |
| title      | string     | null: false                    |
| name       | string     | null: false                    |
| importer   | string     |                                |
| genre_id   | integer    | null: false                    |
| country_id | integer    | null: false                    |
| type_id    | integer    | null: false                    |
| taste_id   | integer    |                                |
| grape_id   | integer    |                                |
| price_id   | integer    |                                |
| text       | text       |                                |
| user       | references | null: false, foreign_key: true |

### Association
- belongs_to :user
- has_many :comments, dependent: :destroy
- belongs_to :category

- has_many :favorites, dependent: destroy

## usersテーブル
| Column   | Type   | Options                   |
| -------- | ------ | ------------------------- |
| nickname | string | null: false               |
| email    | string | null: false, unique: true |
| password | string | null: false               |

### Association
- has_many :posts, dependent: :destroy
- has_many :comments, dependent: :destroy
- has_one :profile
- has_many :favorites, dependent: destroy
- has_many :followers, dependent: :destroy

## commentsテーブル
| Column | Type       | Options                        |
| ------ | ---------- | ------------------------------ |
| text   | text       | null: false                    |
| post   | references | null: false, foreign_key: true |
| user   | references | null: false, foreign_key: true |

### Association
- belongs_to :post
- belongs_to :user

## profilesテーブル
| Column        | Type       | Options                        |
| ------------- | ---------- | ------------------------------ |
| shop          | string     |                                |
| prefecture_id | integer    |                                |
| customer_id   | integer    |                                |
| price_id      | integer    |                                |
| country_id    | integer    |                                |
| user          | references | null: false, foreign_key: true |


### Association
- belongs_to :user

## categoriesテーブル
| Column | Type       | Options                        |
| ------ | ---------- | ------------------------------ |
| genre  |            | null: false                    |
| post   | references | null: false; foreign_key: true |

### Association
- belongs_to :post

## followsテーブル
| Column      | Type    | Options     |
| ----------- | ------- | ----------- |
| follower_id | integer | null: false |
| folowee_id  | integer | null: false |

### Association
- belongs_to :user

## favoritesテーブル
| Column | Type       | Options                        |
| ------ | ---------- | ------------------------------ |
| post   | references | null: false, foreign_key: true |
| user   | references | null: false, foreign_key: true |


### Association
- belongs_to :post
- belongs_to :user