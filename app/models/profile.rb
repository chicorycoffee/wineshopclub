class Profile < ApplicationRecord
  belongs_to :user

  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to :prefecture
  belongs_to :customer
  belongs_to :price
  belongs_to :country

  validates :introduction, { length: { maximum: 140 } }
  validates :shop, { length: { maximum: 30 } }
end
