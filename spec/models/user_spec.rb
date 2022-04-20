require 'rails_helper'

RSpec.describe User, type: :model do
  # pending "add some examples to (or delete) #{__FILE__}"
    before do
     @user = FactoryBot.build(:user)
    end

  describe 'ユーザー新規登録' do

    it '全ての項目が入力されていれば登録できる' do
      expect(@user).to be_valid
    end

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

    it '同じemailアドレスは登録できないこと' do
      @user.save
      another_user = FactoryBot.build(:user)
      another_user.email = @user.email
      another_user.valid?
      expect(another_user.errors.full_messages).to include("Email has already been taken")
    end

    it 'emailアドレスが@を含まないと登録できない' do
      @user.email = 'test'
      @user.valid?
      expect(@user.errors.full_messages).to include("Email is invalid")
    end

    it 'passwordが空では登録できない' do
      @user.password = ''
      @user.valid?
      expect(@user.errors.full_messages).to include("Password can't be blank")
    end

    it 'passwordは6文字未満では登録できない' do
      @user.password = 'a1234'
      @user.valid?
      expect(@user.errors.full_messages).to include( "Password is too short (minimum is 6 characters)")
    end



    it 'passwordは英字のみのパスワードでは登録できない' do
      @user.password = 'abc'
      @user.valid?
      expect(@user.errors.full_messages).to include("Password は半角英数を両方含む必要があります")
    end

    it 'passwordは数字のみのパスワードでは登録できない' do
      @user.password = '123'
      @user.valid?
      expect(@user.errors.full_messages).to include("Password は半角英数を両方含む必要があります")
    end

    it 'passwordは全角文字を含むパスワードでは登録できない' do
      @user.password = 'ABC'
      @user.valid?
      expect(@user.errors.full_messages).to include("Password は半角英数を両方含む必要があります")
    end


    it 'passwordとpassword（確認）は値が一致しないと登録できない' do
      @user.password_confirmation = ''
      @user.valid?
      expect(@user.errors.full_messages).to include("Password confirmation doesn't match Password")
    end

    it '名字が空では登録できない' do
      @user.first_name = ''
      @user.valid?
      expect(@user.errors.full_messages).to include("First name can't be blank")
    end

    it '名字は全角（漢字・ひらがな・カタカナ）でないと登録できない' do
      @user.first_name = '111'
      @user.valid?
      expect(@user.errors.full_messages).to include("First name 全角文字を使用してください")
    end

    it '名前が空では登録できない' do
      @user.last_name = ''
      @user.valid?
      expect(@user.errors.full_messages).to include("Last name can't be blank")
    end

    it '名前は全角（漢字・ひらがな・カタカナ）でないと登録できない' do
      @user.last_name = ''
      @user.valid?
      expect(@user.errors.full_messages).to include("Last name 全角文字を使用してください")
    end

    it '生年月日が空では登録できない' do
      @user.birthday = ''
      @user.valid?
      expect(@user.errors.full_messages).to include("Birthday can't be blank")
    end

    it "姓（カナ）が空だと登録できない" do
      @user.first_name_kana = ''
      @user.valid?
      expect(@user.errors.full_messages).to include("First name kana can't be blank")
    end

    it "姓（カナ）にカタカナ以外の文字（平仮名・漢字・英数字・記号）が含まれていると登録できない" do
      @user.first_name_kana = '漢字'
      @user.valid?
      expect(@user.errors.full_messages).to include("First name kana はカタカナで入力して下さい。")
    end

    it "名（カナ）が空だと登録できない" do
      @user.last_name_kana = ''
      @user.valid?
      expect(@user.errors.full_messages).to include("Last name kana can't be blank")
    end

    it "名（カナ）にカタカナ以外の文字（平仮名・漢字・英数字・記号）が含まれていると登録できない" do
      @user.last_name_kana = '漢字'
      @user.valid?
      expect(@user.errors.full_messages).to include("Last name kana はカタカナで入力して下さい。")
    end
  end  
end