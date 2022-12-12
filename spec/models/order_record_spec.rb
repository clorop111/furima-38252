require 'rails_helper'

RSpec.describe OrderRecord, type: :model do
  before do
    @order_record = FactoryBot.build(:order_record)
  end

  describe '配送先情報の保存' do
    context '配送先情報が保存できるとき'do
      it '全ての情報が入力されていれば保存できること' do
        expect(@order_record).to be_valid
      end
    end

    context '配送先情報の保存ができないとき' do
      it 'user_idが空だと保存できない' do
        @order_record.user_id = nil
        @order_record.valid?
        expect(@order_record.errors.full_messages).to include("User can't be blank")
      end
      it 'item_idが空だと保存できない' do
        @order_record.item_id = nil
        @order_record.valid?
        expect(@order_record.errors.full_messages).to include("Item can't be blank")
      end
      it '郵便番号が空だと保存できないこと' do
        
        @order_record.post_code = nil
        @order_record.valid?
        expect(@order_record.errors.full_messages).to include("Post code can't be blank", "Post code is invalid. Include hyphen(-)")
      end
      it '郵便番号にハイフンがないと保存できないこと' do
        
        @order_record.post_code = 1_234_567
        @order_record.valid?
        expect(@order_record.errors.full_messages).to include("Post code is invalid. Include hyphen(-)")
      end
      it '都道府県が「---」だと保存できないこと' do
        @order_record.prefecture_id = 0
        @order_record.valid?
        expect(@order_record.errors.full_messages).to include("Prefecture can't be blank")
      end
      it '都道府県が空だと保存できないこと' do
        @order_record.prefecture_id = nil
        @order_record.valid?
        expect(@order_record.errors.full_messages).to include("Prefecture can't be blank")
      end
      it '市区町村が空だと保存できないこと' do
        @order_record.city = nil
        @order_record.valid?
        expect(@order_record.errors.full_messages).to include("City can't be blank")
      end
      it '番地が空だと保存できないこと' do
        binding.pry
        @order_record.address = nil
        @order_record.valid?
        expect(@order_record.errors.full_messages).to include("Address can't be blank"")
      end
      it '電話番号が空だと保存できないこと' do
        @order_record.phone_number = nil
        @order_record.valid?
        expect(@order_record.errors.full_messages).to include("Phone number can't be blank")
      end
      it '電話番号にハイフンがあると保存できないこと' do
        @order_record.phone_number = '123 - 1234 - 1234'
        @order_record.valid?
        expect(@order_record.errors.full_messages).to include('Phone number is invalid')
      end
      it '電話番号が12桁以上あると保存できないこと' do
        @order_record.phone_number = 12_345_678_910_123_111
        @order_record.valid?
        expect(@order_record.errors.full_messages).to include('Phone number is invalid')
      end
      it 'トークンが空だと保存できないこと' do
        @order_record.token = nil
        @order_record.valid?
        expect(@order_record.errors.full_messages).to include("Token can't be blank")
      end
    end
  end
end
