class Country < ActiveHash::Base
  self.data = [
    { id: 1, name: '選択してください' },
    { id: 2, name: 'フランス' },
    { id: 3, name: 'イタリア' },
    { id: 4, name: 'スペイン' },
    { id: 5, name: 'ドイツ' },
    { id: 6, name: 'アメリカ' },
    { id: 7, name: 'オーストラリア' },
    { id: 8, name: 'チリ' },
    { id: 9, name: '南アフリカ' },
    { id: 10, name: '日本' },
    { id: 11, name: 'その他' }
  ]

  include ActiveHash::Associations
  has_many :posts
  has_many :profiles
end
