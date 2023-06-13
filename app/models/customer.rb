class Customer < ActiveHash::Base
  self.data = [
    { id: 1, name: '選択してください' },
    { id: 2, name: '20〜30代・男性' },
    { id: 3, name: '20~30代・女性' },
    { id: 4, name: '40~50代・男性' },
    { id: 5, name: '40~50代・女性' },
    { id: 6, name: '60代以上・男性' },
    { id: 7, name: '60代以上・女性' }
  ]

  include ActiveHash::Associations
  has_many :profiles

  end