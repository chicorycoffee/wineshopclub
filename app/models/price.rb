class Price < ActiveHash::Base
  self.data = [
    { id: 1, name: '---' },
    { id: 2, name: '1,000円未満' },
    { id: 3, name: '1,000円以上〜1,500円未満' },
    { id: 4, name: '1,500円以上〜2,000円未満' },
    { id: 5, name: '2,000円以上〜2,500円未満' },
    { id: 6, name: '2,500円以上〜3,000円未満' },
    { id: 7, name: '3,000円以上〜3,500円未満' },
    { id: 8, name: '3,500円以上〜4,000円未満' },
    { id: 9, name: '4,000円以上〜4,500円未満' },
    { id: 10, name: '4,500円以上〜5,000円未満' },
    { id: 11, name: '5,000円以上〜10,000円未満' },
    { id: 12, name: '1万円以上' }
    { id: 13, name: 'その他' }
  ]

  include ActiveHash::Associations
  has_many :posts
  
  end