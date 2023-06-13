class Type < ActiveHash::Base
  self.data = [
    { id: 1, name: '選択してください' },
    { id: 2, name: '赤' },
    { id: 3, name: '白' },
    { id: 4, name: 'スパークリング' },
    { id: 5, name: 'ロゼ' },
    { id: 6, name: 'オレンジ' },
    { id: 7, name: 'その他' }
  ]

  include ActiveHash::Associations
  has_many :posts
  
  end