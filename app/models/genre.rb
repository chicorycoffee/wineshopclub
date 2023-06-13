class Genre < ActiveHash::Base
  self.data = [
    { id: 1, name: '選択してください' },
    { id: 2, name: '今売れてます' },
    { id: 3, name: '次のシーズンで注力' },
    { id: 4, name: '探してます' }
  ]

  include ActiveHash::Associations
  has_many :posts

  end