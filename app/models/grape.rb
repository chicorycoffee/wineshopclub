class Grape < ActiveHash::Base
  self.data = [
    { id: 1, name: '---' },
    { id: 2, name: 'カベルネ・ソーヴィニヨン' },
    { id: 3, name: 'ピノ・ノワール' },
    { id: 4, name: 'メルロ' },
    { id: 5, name: 'シラー' },
    { id: 6, name: 'テンプラニーリョ' },
    { id: 7, name: 'グルナッシュ' },
    { id: 8, name: 'ガメイ' },
    { id: 9, name: 'ネッビオーロ' },
    { id: 10, name: 'マスカット・ベーリーA' },
    { id: 11, name: 'シャルドネ' },
    { id: 12, name: 'ソーヴィニヨン・ブラン' },
    { id: 13, name: 'リースリング' },
    { id: 14, name: 'ピノ・グリ' },
    { id: 15, name: 'マスカット・ベーリーA' },
    { id: 16, name: 'シャルドネ' },
    { id: 17, name: 'ソーヴィニヨン・ブラン' },
    { id: 18, name: 'リースリング' },
    { id: 19, name: 'ピノ・グリ' },
    { id: 20, name: '甲州' },
    { id: 21, name: 'ゲヴュルツトラミネール' }
    { id: 22, name: 'その他' }
  ]

  include ActiveHash::Associations
  has_many :posts

  end