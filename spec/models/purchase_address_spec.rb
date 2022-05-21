require 'rails_helper'

RSpec.describe PurchaseAddress, type: :model do
  describe '商品の配送先情報' do
    before do
      user = FactoryBot.create(:user)
      item = FactoryBot.create(:item)
      @purchase_address = FactoryBot.build(:purchase_address, user_id: user.id, item_id: item.id)
     end
  

      context '内容に問題がない場合' do
          it 'すべての値が正しく入力されていれば保存できること' do
             expect(@purchase_address).to be_valid
          end

          it 'building_nameは空でも保存できること' do
            @purchase_address.building_name = ''
            expect(@purchase_address).to be_valid
          end
        end


      context '内容に問題がある場合' do
        it 'postal_codeが空だと保存できないこと' do
          @purchase_address.postal_code = ''
          @purchase_address.valid?
          expect(@purchase_address.errors.full_messages).to include("Postal code can't be blank")
          end

        it 'postal_codeが半角のハイフンを含んだ正しい形式でないと保存できないこと' do
          @purchase_address.postal_code = '1234567'
          @purchase_address.valid?
          expect(@purchase_address.errors.full_messages).to include('Postal code is invalid. Include hyphen(-)')
        end

        it 'area_idが0では登録できない' do
          @purchase_address.area_id = 0
          @purchase_address.valid?
          expect(@purchase_address.errors.full_messages).to include("Area can't be blank")
        end

        it 'cityが空では登録できない' do
          @purchase_address.city = ''
          @purchase_address.valid?
          expect(@purchase_address.errors.full_messages).to include("City can't be blank")
        end
        
        it 'house_numberが空では登録できない' do
          @purchase_address.house_number = ''
          @purchase_address.valid?
          expect(@purchase_address.errors.full_messages).to include("House number can't be blank")
        end

        it 'telephone_numberが空では登録できない' do
        @purchase_address.telephone_number = ''
        @purchase_address.valid?
        expect(@purchase_address.errors.full_messages).to include("Telephone number can't be blank")
        end

        it 'telephone_numberは、10桁以上11桁以内の半角数値のみ保存可能なこと' do
        @purchase_address.telephone_number = '111'
        @purchase_address.valid?
        expect(@purchase_address.errors.full_messages).to include("Telephone number is invalid")
        end

        it '上限を超える登録できない（12桁以上では登録できない）' do
        @purchase_address.telephone_number = '1111222233334444'
        @purchase_address.valid?
        expect(@purchase_address.errors.full_messages).to include("Telephone number is invalid")
        end


        it '半角数字以外が含まれていると登録できない'do
        @purchase_address.telephone_number = '１２３４'
        @purchase_address.valid?
        expect(@purchase_address.errors.full_messages).to include("Telephone number is invalid")
        end


        it 'tokenが空では登録できない' do
        @purchase_address.token = ''
        @purchase_address.valid?
        expect(@purchase_address.errors.full_messages).to include("Token can't be blank")
        end

        it 'userが紐付いていないと保存できない' do
          @purchase_address.user_id = nil
          @purchase_address.valid?
          expect(@purchase_address.errors.full_messages).to include("User can't be blank")
        end

        it 'itemが紐付いていないと保存できない' do
          @purchase_address.item_id = nil
          @purchase_address.valid?
          expect(@purchase_address.errors.full_messages).to include("Item can't be blank")
        end
      end
  end 
end
