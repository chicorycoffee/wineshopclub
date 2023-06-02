class Post < ApplicationRecord
  belongs_to :user
  has_one_attached :image

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

end
