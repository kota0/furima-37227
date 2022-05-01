require 'rails_helper'

RSpec.describe Item, type: :model do
  before do
    @item = FactoryBot.build(:item)
  end

  describe '商品出品機能' do
    
    context '商品出品ができる時' do
     it '商品出品ができる時' do
      expect(@item).to be_valid
     end
     end


    context '商品出品ができない時' do
      it '商品名が空では登録できない' do
        @item.product_name = ''
        @item.valid?
        expect(@item.errors.full_messages).to include("Product name can't be blank")
      end

      it '商品画像が空では登録できない' do
        @item.image = nil
        @item.valid?
        expect(@item.errors.full_messages).to include("Image can't be blank")
      end

      it '説明が空では登録できない' do
        @item.description_of_item = ''
        @item.valid?
        expect(@item.errors.full_messages).to include("Description of item can't be blank")
      end

      it 'category_idが1では登録できない' do
        @item.category_id = 1
        @item.valid?
        expect(@item.errors.full_messages).to include("Category can't be blank")
      end

      it 'situation_idが1では登録できない' do
        @item.situation_id = 1
        @item.valid?
        expect(@item.errors.full_messages).to include("Situation can't be blank")
      end

      it 'pay_for_idが1では登録できない' do
        @item.pay_for_id = 1
        @item.valid?
        expect(@item.errors.full_messages).to include("Pay for can't be blank")
      end

      it 'shipping_data_idが1では登録できない' do
        @item.shipping_data_id = 1
        @item.valid?
        expect(@item.errors.full_messages).to include("Shipping data can't be blank")
      end

      it 'area_idが1では登録できない' do
        @item.area_id = 1
        @item.valid?
        expect(@item.errors.full_messages).to include("Area can't be blank")
      end

      it 'priceが空では登録できない' do
        @item.price = ' '
        @item.valid?
        expect(@item.errors.full_messages).to include('Price is invalid')
      end

      it 'priceが半角でないと登録できない' do
        @item.price = '３００'
        @item.valid?
        expect(@item.errors.full_messages).to include('Price is invalid')
      end

      it 'priceが300円未満では出品できない' do
        @item.price = 299
        @item.valid?
        expect(@item.errors.full_messages).to include('Price is invalid')
      end

      it 'priceが9999999円を超えると登録できない' do
        @item.price = 99_999_999
        @item.valid?
        expect(@item.errors.full_messages).to include('Price is invalid')
      end

      it 'userが紐付いていないと保存できない' do
        @item.user = nil
        @item.valid?
        expect(@item.errors.full_messages).to include("User must exist")
      end

    end
  end
end
