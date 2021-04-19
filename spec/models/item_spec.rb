require 'rails_helper'

RSpec.describe Item, type: :model do
  before do
    @user = FactoryBot.create(:user)
    @item = FactoryBot.build(:item,user_id:@user.id)
    
  end

  describe "出品機能" do
    context "出品できるとき" do
      it '商品画像、商品名商品の説明、カテゴリー、商品の状態、配送料の負担、発送元の地域、発送までの日数、価格、販売価格が存在すれば出品できること' do
        expect(@item).to be_valid
      end
    end
      context "出品できないとき" do
        it '商品画像が空では登録できない' do
         @item.image = nil
         @item.valid?
         expect(@item.errors.full_messages).to include("Image can't be blank")
        end
        it '商品名が空では出品できない' do
          @item.product_name = ''
          @item.valid?
          expect(@item.errors.full_messages).to include("Product name can't be blank")
        end
        it '商品の説明が空では出品できない' do
          @item.description = ''
          @item.valid?
          expect(@item.errors.full_messages).to include("Description can't be blank")
        end
        it 'カテゴリーの情報が空では出品できない' do
          @item.category_id = 1
          @item.valid?
          expect(@item.errors.full_messages).to include("Category must be other than 1")
        end
        it '商品の状態の情報が空では出品できない' do
          @item.condition_id = 1
          @item.valid?
          expect(@item.errors.full_messages).to include("Condition must be other than 1")
        end
        it '配送料の負担の情報が空では出品できない' do
          @item.charge_id = 1
          @item.valid?
          expect(@item.errors.full_messages).to include("Charge must be other than 1")
        end
        it '発送元の地域についての情報が空では出品できない' do
          @item.area_id = 1
          @item.valid?
          expect(@item.errors.full_messages).to include("Area must be other than 1")
        end
        it '発送までの日数についての情報が空では出品できない' do
          @item.delivery_id = 1
          @item.valid?
          expect(@item.errors.full_messages).to include("Delivery day must be other than 1")
        end
        it '価格についての情報が空では出品できない' do
          @item.price = ''
          @item.valid?
          expect(@item.errors.full_messages).to include("Price can't be blank")
        end
        it '価格の範囲が、¥300未満ではなければ出品できない' do
          @item.price = 100
          @item.valid?
          expect(@item.errors.full_messages).to include("Price must be greater than or equal to 300")
        end
        it '販売価格が英数では出品できない' do
          @item.price = "abc"
          @item.valid?
          expect(@item.errors.full_messages).to include("Price is not a number")
        end
        it '販売価格が全角では出品できない' do
          @item.price = "１２３４５"
          @item.valid?
          expect(@item.errors.full_messages).to include("Price is not a number")
        end
        it '価格が半角英数混合では登録できないこと' do
          @item.price = "423gj"
          @item.valid?
          expect(@item.errors.full_messages).to include("Price is not a number")
        end
        it '価格が10,000,000以上では登録できないこと' do
          @item.price = 10000000000
          @item.valid?
          expect(@item.errors.full_messages).to include("Price must be less than or equal to 9999999")
        end
    end
  end

end
