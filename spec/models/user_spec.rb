require 'rails_helper'
RSpec.describe User, type: :model do
  before do
    @user = FactoryBot.build(:user)
  end

  describe 'ユーザー新規登録' do
    context '新規登録できるとき' do
    it 'nickname、email、password、password_confirmation、
    ユーザー本名（名字と名前、カナ）、生年月日が存在すれば登録できる' do
      expect(@user).to be_valid
    end
   
  end
  context '新規登録できないとき' do
    it 'nicknameが空では登録できない' do
      @user.nickname = ''
      @user.valid?
      expect(@user.errors.full_messages).to include("Nickname can't be blank")
    end
    it 'emailが空では登録できない' do
      @user.email = ''
      @user.valid?
      expect(@user.errors.full_messages).to include("Email can't be blank")
    end

    
    it 'passwordが空では登録できない' do
      @user.password = ''
      @user.valid?
      expect(@user.errors.full_messages).to include("Password can't be blank")
    end
    it 'passwordが存在してもpassword_confirmationが空では登録できない' do
      @user.password_confirmation = ''
      @user.valid?
      expect(@user.errors.full_messages).to include("Password confirmation doesn't match Password")
    end

    it 'password,password_confirmationが半角英数字混合でなければ登録できない' do
     @user.password = 'aaaaaa'
     @user.password_confirmation = 'aaaaaa'
     expect(@user.errors.full_messages).to include()
    end
    
    it '重複したemailが存在する場合登録できない' do
      @user.save
  another_user = FactoryBot.build(:user)
  another_user.email = @user.email
  another_user.valid?
  expect(another_user.errors.full_messages).to include('Email has already been taken')
    end
    it 'emailに@が含まれなければ登録できない' do
      @user.email = 'test.softbank.ne.jp'
      @user.valid?
      expect(@user.errors.full_messages).to include("Email is invalid")
    end
  
    it 'passwordが5文字以下では登録できない' do
      @user.password = '00000'
  @user.password_confirmation = '00000'
  @user.valid?
  expect(@user.errors.full_messages).to include('Password is too short (minimum is 6 characters)')
    end

    it "ユーザー本名の名字のフリガナは全角（カタカナ）でなければ登録できない" do
      @user.first_name_kana = "かな"
      @user.valid?
      expect(@user.errors.full_messages).to include("First name kana 全角（カタカナ）のみ使えます")
    end
    it "ユーザー本名の名前のフリガナは全角（カタカナ）でなければ登録できない" do
      @user.last_name_kana = "かな"
      @user.valid?
      expect(@user.errors.full_messages).to include("Last name kana 全角（カタカナ）のみ使えます")
    end
    it "ユーザー本名の名字は全角（漢字・ひらがな・カタカナ）でなければ登録できない" do
      @user.first_name = "kana"
      @user.valid?
      expect(@user.errors.full_messages).to include("First name 全角（漢字・ひらがな・カタカナ）のみ使えます")
    end
    it "ユーザー本名の名前は全角（漢字・ひらがな・カタカナ）でなければ登録できない" do
      @user.last_name = "kana"
      @user.valid?
      expect(@user.errors.full_messages).to include("Last name 全角（漢字・ひらがな・カタカナ）のみ使えます")
    end
end
end
end
  
  
