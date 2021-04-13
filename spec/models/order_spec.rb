require 'rails_helper'

RSpec.describe Order, type: :model do
  before do
    @order = FactoryBot.build(:order)
  end
  describe '商品購入' do
    context '商品購入できるとき' do
      it '郵便番号・都道府県・市区町村・番地・電話番号が存在すれば購入できる' do
        expect(@order).to be_valid
      end
    end
      context '商品購入できないとき' do
        it '郵便番号が空では購入できない' do
          @order.postal_code = ''
      @order.valid?
      expect(@order.errors.full_messages).to include("")
        end
        it '郵便番号はハイフンがなければ購入できない' do
          @order.postal_code = '1234567'
      @order.valid?
      expect(@order.errors.full_messages).to include("")
        end
        it '都道府県が空では購入できない' do
          @order.area_id = 1
      @order.valid?
      expect(@order.errors.full_messages).to include("")
        end
        it '市区町村が空では購入できない' do
          @order.municipalities = ""
      @order.valid?
      expect(@order.errors.full_messages).to include("")
        end
        it '番地が空では購入できない' do
          @order.street_num = ""
      @order.valid?
      expect(@order.errors.full_messages).to include("")
        end
        it '電話番号が空では購入できない' do
          @order.street_num = ""
      @order.valid?
      expect(@order.errors.full_messages).to include("")
        end
        it '電話番号は12桁以上では購入できない' do
          @order.street_num = "123456789123"
      @order.valid?
      expect(@order.errors.full_messages).to include("")
        end
        it '電話番号はハイフンがあると購入できない' do
          @order.street_num = "1234−567"
      @order.valid?
      expect(@order.errors.full_messages).to include("")
        end
      end
    end
  end
