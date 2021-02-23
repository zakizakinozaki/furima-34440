class Status < ActiveHash::Base
  self.data = [
    { id: 1, name: '---' },
    { id: 2, name: '新品、未使用' },
    { id: 3, name: '傷・汚れなし' },
    { id: 4, name: '傷・汚れあり' },
    { id: 5, name: '状態が悪い' }
  ]

  include ActiveHash::Associations
  has_many :products
end
