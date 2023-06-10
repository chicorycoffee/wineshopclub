class Post < ApplicationRecord
  belongs_to :user
  has_one_attached :image
  has_many :comments, dependent: :destroy
  has_many :likes

  validates :title, presence: true
  validates :name, presence: true

  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to :genre
  belongs_to :country
  belongs_to :price
  belongs_to :grape
  belongs_to :taste
  belongs_to :type

  validates :genre_id, numericality: { other_than: 1 , message: "を選んでください"}
  validates :country_id, numericality: { other_than: 1 , message: "を選んでください"}
  validates :type_id, numericality: { other_than: 1 , message: "を選んでください"}

  validates :text, {length: {maximum: 140}}
  validates :title, {length: {maximum: 30}}
  validates :name, {length: {maximum: 50}}
  validates :importer, {length: {maximum: 15}}

  def liked_by(user)
    likes.where(user_id: user.id).exists?
  end
end
