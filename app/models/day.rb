class Day < ActiveHash::Base
  self.data = [
    { id: 1, name: '---' },
    { id: 2, name: '1~2日で発送' },
    { id: 3, name: '2~3日で発送' },
    { id: 4, name: '3~4日で発送' },
    { id: 5, name: '1週間以上で発送' }
  ]

  include ActiveHash::Associations
  has_many :products
end
