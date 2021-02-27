class Order
  include ActiveModel::Model
  attr_accessor :postal_code, :state_id, :city, :address, :building, :phone_num, :user_id, :product_id, :purchase_id, :token

  with_options presence: true do
    validates :postal_code, format: { with: /\A[0-9]{3}-[0-9]{4}\z/, message: 'Input correctly' }
    validates :state_id, numericality: { other_than: 1, message: 'Select' }
    validates :city
    validates :address
    validates :phone_num, format: { with: /[0-9]{,11}\d/, message: 'Input only number' }
    validates :user_id
    validates :product_id
    validates :token
  end

  def save
    purchase = Purchase.create(user_id: user_id, product_id: product_id)
    Buyer.create(postal_code: postal_code, state_id: state_id, city: city, address: address, building: building, phone_num: phone_num,
                 purchase_id: purchase.id)
  end
end
