require 'rails_helper'

RSpec.describe Product, type: :model do
  before do
    @product = FactoryBot.build(:product)
  end

  describe '商品出品機能' do
    context '商品出品できるとき' do
      it 'image、 name、 description、 category_id、 status_id、 cost_id、 state_id、day_id、 price、user_idが存在すれば出品できる' do
        user = FactoryBot.create(:user)
        @product = FactoryBot.build(:product, user_id: user[:id])
        expect(@product).to be_valid
      end
    end

    context '商品出品できないとき' do
      it 'imageが空では出品できない' do
        @product.image = nil
        @product.valid?
        expect(@product.errors.full_messages).to include("Image can't be blank")
      end

      it 'imageが存在してもファイル形式がjpegもしくはpngでなければ出品できない' do
        @product.image = fixture_file_upload('public/images/test.webp')
        @product.valid?
        expect(@product.errors.full_messages).to include('Image にはjpegまたはpngファイルを添付してください')
      end

      it 'nameが空では出品できない' do
        @product.name = ''
        @product.valid?
        expect(@product.errors.full_messages).to include("Name can't be blank")
      end

      it 'descriptionが空では出品できない' do
        @product.description = ''
        @product.valid?
        expect(@product.errors.full_messages).to include("Description can't be blank")
      end

      it 'category_idの選択が1の場合出品できない' do
        @product.category_id = 1
        @product.valid?
        expect(@product.errors.full_messages).to include('Category Select')
      end

      it 'status_idの選択が1の場合出品できない' do
        @product.status_id = 1
        @product.valid?
        expect(@product.errors.full_messages).to include('Status Select')
      end

      it 'cost_idの選択が1の場合出品できない' do
        @product.cost_id = 1
        @product.valid?
        expect(@product.errors.full_messages).to include('Cost Select')
      end

      it 'state_idの選択が1の場合出品できない' do
        @product.state_id = 1
        @product.valid?
        expect(@product.errors.full_messages).to include('State Select')
      end

      it 'day_idの選択が1の場合出品できない' do
        @product.day_id = 1
        @product.valid?
        expect(@product.errors.full_messages).to include('Day Select')
      end

      it 'priceが空では出品できない' do
        @product.price = ''
        @product.valid?
        expect(@product.errors.full_messages).to include("Price can't be blank")
      end

      it 'priceが299以下では出品できない' do
        @product.price = 299
        @product.valid?
        expect(@product.errors.full_messages).to include('Price Out of setting range')
      end

      it 'priceが10000000以上では出品できない' do
        @product.price = 10_000_000
        @product.valid?
        expect(@product.errors.full_messages).to include('Price Out of setting range')
      end

      it 'priceが半角数字でなければ出品できない' do
        @product.price = 'test'
        @product.valid?
        expect(@product.errors.full_messages).to include('Price Half-width number')
      end

      it 'userが紐付いていないと出品できない' do
        @product.user = nil
        @product.valid?
        expect(@product.errors.full_messages).to include('User must exist')
      end
    end
  end
end
