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
- has_one_attached :image
- has_many :comments, dependent: :destroy
- has_many :likes, dependent: :destroy


## usersテーブル
| Column   | Type   | Options                   |
| -------- | ------ | ------------------------- |
| nickname | string | null: false               |
| email    | string | null: false, unique: true |
| password | string | null: false               |

### Association
- has_many :posts, dependent: :destroy
- has_many :comments, dependent: :destroy
- has_many :active_relationships, class_name: 'Relationship' foreign_key: :following_id, dependent: :destroy
- has_many :followings, through: :active_relationships, source: :follower, dependent: :destroy
- has_many :passive_relationships, class_name: 'Relationship', foreign_key: :follower_id, dependent: :destroy
- has_many :followers, through: :passive_relationships, source: :following, dependent: :destroy
- has_many :likes, dependent: :destroy
- has_one :profile, dependent: :destroy

## commentsテーブル
| Column | Type       | Options                        |
| ------ | ---------- | ------------------------------ |
| text   | string     | null: false                    |
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
| introduction  | text       |                                |
| user          | references | null: false, foreign_key: true |


### Association
- belongs_to :user

## relationshipsテーブル
| Column    | Type       | Options     |
| --------- | ---------- | ----------- |
| follower  | references |             |
| following | references |             |

### Association
- belongs_to :following, class_name: 'User'
- belongs_to :follower, class_name: 'User'

## likesテーブル
| Column | Type       | Options           |
| ------ | ---------- | ----------------- |
| post   | references | foreign_key: true |
| user   | references | foreign_key: true |


### Association
- belongs_to :post
- belongs_to :user
