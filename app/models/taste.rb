class Taste < ActiveHash::Base
  self.data = [
    { id: 1, name: '選択してください' },
    { id: 2, name: 'ライトボディ' },
    { id: 3, name: 'ミディアムボディ' },
    { id: 4, name: 'フルボディ' },
    { id: 5, name: '極辛口' },
    { id: 6, name: '辛口' },
    { id: 7, name: '甘口' },
    { id: 8, name: '極甘口' },
    { id: 9, name: 'その他' }
  ]

  include ActiveHash::Associations
  has_many :posts
  
  end