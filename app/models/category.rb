class Category < ActiveHash::Base
  self.data = [
    { id: 1, name: '---' },
    { id: 2, name: 'レディース' },
    { id: 3, name: 'メンズ' },
    { id: 4, name: 'キッズ' },
    { id: 5, name: 'ベビー' }
  ]

  include ActiveHash::Associations
  has_many :products
end
