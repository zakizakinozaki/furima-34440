require 'rails_helper'

RSpec.describe Order, type: :model do
  before do
    user = FactoryBot.create(:user)
    product = FactoryBot.create(:product)
    @order = FactoryBot.build(:order, user_id: user[:id], product_id: product[:id])
    sleep 0.1
  end

  describe '商品購入機能' do
    context '商品購入できる時' do
      it 'postal_code、state_id、city、address、phonw_num、product_id、user_id、tokenが存在していれば購入できる' do
        expect(@order).to be_valid
      end

      it 'buildingが空でも購入できる' do
        @order.building = ''
        expect(@order).to be_valid
      end
    end

    context '商品購入できない時' do
      it 'postal_codeが空では購入できない' do
        @order.postal_code = ''
        @order.valid?
        expect(@order.errors.full_messages).to include("Postal code can't be blank")
      end

      it 'postal_codeにハイフンが含まれていなければ購入できない' do
        @order.postal_code = 1_234_567
        @order.valid?
        expect(@order.errors.full_messages).to include('Postal code Input correctly')
      end

      it 'state_idの選択が1の場合、購入できない' do
        @order.state_id = 1
        @order.valid?
        expect(@order.errors.full_messages).to include('State Select')
      end

      it 'cityが空のでは購入できない' do
        @order.city = ''
        @order.valid?
        expect(@order.errors.full_messages).to include("City can't be blank")
      end

      it 'addressが空のでは購入できない' do
        @order.address = ''
        @order.valid?
        expect(@order.errors.full_messages).to include("Address can't be blank")
      end

      it 'phone_numが空では購入できない' do
        @order.phone_num = ''
        @order.valid?
        expect(@order.errors.full_messages).to include("Phone num can't be blank")
      end

      it 'phone_numは11桁以内の数値出なければ購入できない' do
        @order.phone_num = 'test'
        @order.valid?
        expect(@order.errors.full_messages).to include('Phone num Input only number')
      end

      it 'tokenが空では登録できない' do
        @order.token = ''
        @order.valid?
        expect(@order.errors.full_messages).to include("Token can't be blank")
      end

      it 'user_idが空の場合購入できない' do
        @order.user_id = nil
        @order.valid?
        expect(@order.errors.full_messages).to include("User can't be blank")
      end

      it 'product_idが空の場合購入できない' do
        @order.product_id = nil
        @order.valid?
        expect(@order.errors.full_messages).to include("Product can't be blank")
      end
    end
  end
end
