require 'rails_helper'

RSpec.describe Order, type: :model do
  before do
    @user = FactoryBot.create(:user)
    @item = FactoryBot.create(:item,user_id:@user.id)
    @order = FactoryBot.build(:order,user_id:@user.id,item_id:@item.id)
    sleep(1)
  end
  describe '商品購入' do
    context '商品購入できるとき' do
      it '郵便番号・都道府県・市区町村・番地・電話番号が存在すれば購入できる' do
        expect(@order).to be_valid
      end
      it '建物名が空でも購入できる' do
        @order.building = ""
        expect(@order).to be_valid
      end
    end
      context '商品購入できないとき' do
        it '郵便番号が空では購入できない' do
          @order.postal_code = ''
          @order.valid?
          expect(@order.errors.full_messages).to include("Postal code can't be blank", "Postal code is invalid")
        end
        it '郵便番号はハイフンがなければ購入できない' do
          @order.postal_code = '1234567'
          @order.valid?
          expect(@order.errors.full_messages).to include("Postal code is invalid")
        end
        it '都道府県が1では購入できない' do
          @order.area_id = 1
          @order.valid?
          expect(@order.errors.full_messages).to include("Area must be other than 1")
        end
        it '市区町村が空では購入できない' do
          @order.municipalities = ""
          @order.valid?
          expect(@order.errors.full_messages).to include("Municipalities can't be blank")
        end
        it '番地が空では購入できない' do
          @order.street_num = ""
          @order.valid?
          expect(@order.errors.full_messages).to include("Street num can't be blank")
        end
        it '電話番号が空では購入できない' do
          @order.phone_num = ""
          @order.valid?
          expect(@order.errors.full_messages).to include("Phone num can't be blank", "Phone num is not a number")
        end
        it '電話番号は12桁以上では購入できない' do
          @order.phone_num = "123456789123"
          @order.valid?
          expect(@order.errors.full_messages).to include("Phone num is too long (maximum is 11 characters)")
        end
        it '電話番号はハイフンがあると購入できない' do
          @order.phone_num = "1234−567"
          @order.valid?
          expect(@order.errors.full_messages).to include("Phone num is not a number")
        end
        it 'user_idが空では購入できないこと' do
          @order.user_id = ""
          @order.valid?
          expect(@order.errors.full_messages).to include("User can't be blank")
        end
        it 'item_idが空では購入できないこと' do
          @order.item_id = ""
          @order.valid?
          expect(@order.errors.full_messages).to include("Item can't be blank")
        end
        it "tokenが空では購入できないこと" do
          @order.token = nil
          @order.valid?
          expect(@order.errors.full_messages).to include("Token can't be blank")
        end
        it '電話番号が英数字混合では購入できない' do
          @order.phone_num = "aaa000"
          @order.valid?
          expect(@order.errors.full_messages).to include("Phone num is not a number")
        end
      end
    end
  end

