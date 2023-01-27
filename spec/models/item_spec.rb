require 'rails_helper'

RSpec.describe Item, type: :model do
  before do
    @item = FactoryBot.build(:item)
  end

  describe '商品出品機能' do
    context '商品出品ができる場合' do
      it 'images、title、explanation、category_id、condition_id、shipping_charge_id、prefecture_id、days_required_id、priceが存在していれば保存できる' do
        expect(@item).to be_valid  
      end
    end


    context '商品出品ができない場合' do
      it 'imagesが空では保存できない' do
        
        @item.images =nil
        @item.valid?
        expect(@item.errors.full_messages).to include "Images は1枚以上5枚以下にしてください"
      end
      it '商品名が空だと登録できない' do
        
        @item.title = ""
        @item.valid?
        expect(@item.errors.full_messages).to include "Title can't be blank"
      end
      it '商品の説明が空だと登録できない' do
        @item.explanation = ""
        @item.valid?
        expect(@item.errors.full_messages).to include "Explanation can't be blank"
      end


      it 'カテゴリーが空だと登録できない' do
      
        @item.category_id = ""
        @item.valid?
        expect(@item.errors.full_messages).to include "Category 入力してください"
      end
      it 'カテゴリーが---だと登録できない' do
        
        @item.category_id = 1
        @item.valid?
        expect(@item.errors.full_messages).to include "Category 入力してください"
      end


      it '商品の状態が空だと登録できない' do

        @item.condition_id = ""
        @item.valid?
        expect(@item.errors.full_messages).to include "Condition 入力してください"
      end
      it '商品の状態が---だと登録できない' do
       
        @item.condition_id = 1
        @item.valid?
        expect(@item.errors.full_messages).to include "Condition 入力してください"
      end


      it '配送料の負担が空だと登録できない' do

        @item.shipping_charge_id = ""
        @item.valid?
        expect(@item.errors.full_messages).to include "Shipping charge 入力してください"
      end
      it '配送料の負担が---だと登録できない' do
        @item.shipping_charge_id = 1
        @item.valid?
        expect(@item.errors.full_messages).to include "Shipping charge 入力してください"
      end


      it '発送元の地域が空だと登録できない' do
        @item.prefecture_id = ""
        @item.valid?
        expect(@item.errors.full_messages).to include "Prefecture 入力してください"
      end
      it '発送元の地域が---だと登録できない' do
        @item.prefecture_id = 1
        @item.valid?
        expect(@item.errors.full_messages).to include "Prefecture 入力してください"
      end


      it '発送までの日数が空だと登録できない' do
        @item.days_required_id = ""
        @item.valid?
        expect(@item.errors.full_messages).to include "Days required 入力してください"
      end
      it '発送までの日数が---だと登録できない' do
        @item.days_required_id = 1
        @item.valid?
        expect(@item.errors.full_messages).to include "Days required 入力してください"
      end

      it '販売価格が空だと登録できない' do
        @item.price = ""
        @item.valid?
        expect(@item.errors.full_messages).to include "Price can't be blank"
      end

      it '販売価格が300以下だと登録できない' do
        
        @item.price = 200
        @item.valid?
        expect(@item.errors.full_messages).to include "Price must be greater than or equal to 300"
      end
      it '販売価格が9,999,999以上だと登録できない' do
        
        @item.price = 10000000
        @item.valid?
        expect(@item.errors.full_messages).to include "Price must be less than or equal to 9999999"
      end

      it '販売価格に半角数字以外が登録されている場合は出品できない' do
        @item.price = '100０'
        @item.valid?
        expect(@item.errors.full_messages).to include "Price is not a number"
      end


      it 'userが紐付いていないと保存できない' do
        
        @item.user = nil
        @item.valid?
        expect(@item.errors.full_messages).to include "User must exist"
      end

    end
  end
end