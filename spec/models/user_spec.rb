require 'rails_helper'

RSpec.describe User, type: :model do
  before do
    @user = FactoryBot.build(:user)
  end

  describe 'ユーザー新規登録' do
    context '新規登録できる場合' do
      it "nameとemail、passwordとpassword_confirmation、名前(全角)、名前（カナ）、生年月日が存在すれば登録できる" do
        expect(@user).to be_valid
      end
    end
    context '新規登録できない場合' do

      #nickname
      it "nicknameが空では登録できない" do
        @user.name = ''
        @user.valid?
        expect(@user.errors.full_messages).to include "Name can't be blank"
      end

      #メールアドレス
      it "emailが空では登録できない" do
        
        @user.email = ''
        @user.valid?
        expect(@user.errors.full_messages).to include "Email can't be blank"
      end
      it "重複したemailが存在する場合は登録できない" do
        
        @user.save
        another_user = FactoryBot.build(:user)
        another_user.email = @user.email
        another_user.valid?
        expect(another_user.errors.full_messages).to include "Email has already been taken"
      end

      it "emailは@を含まないと登録できない" do
        @user.email = 'testcom'
        @user.valid?
        expect( @user.errors.full_messages).to include "Email is invalid"
      end

      #パスワード
      it "passwordが空では登録できない" do
        @user.password = ''
        @user.valid?
        expect(@user.errors.full_messages).to include "Password can't be blank"
      end

      it "passwordが6文字以下では登録できない" do
        @user.password = '00000'
        @user.password_confirmation = '00000'
        @user.valid?
        expect( @user.errors.full_messages).to include "Password is too short (minimum is 6 characters)"
      end

      it "passwordとpassword_confirmationが不一致では登録できない" do  
        @user.password = '123456'
        @user.password_confirmation = '1234567'
        @user.valid?
        expect( @user.errors.full_messages).to include "Password confirmation doesn't match Password"
      end

      it "英字のみのパスワードでは登録できない" do
        @user.password = 'abcdef'
        @user.password_confirmation = 'abcdef'
        @user.valid?
        expect( @user.errors.full_messages).to include "Password is invalid"
      end

      it "数字のみのパスワードでは登録できない" do
        @user.password = '123456'
        @user.password_confirmation = '123456'
        @user.valid?
        expect( @user.errors.full_messages).to include "Password is invalid"
      end

      it "全角文字を含むパスワードでは登録できない" do
        @user.password = '123456Ａ'
        @user.password_confirmation = '123456Ａ'
        @user.valid?
        expect( @user.errors.full_messages).to include "Password is invalid"
      end

      #姓・名（全角）
      it "姓（全角）が空だと登録できない" do
        @user.first_name_kanji = ''
        @user.valid?
        expect(@user.errors.full_messages).to include "First name kanji can't be blank"
      end

      it "姓（全角）に半角文字が含まれていると登録できない" do
        
        @user.first_name_kanji = 'a'
        @user.valid?
        expect(@user.errors.full_messages).to include "First name kanji is invalid"

      end

      it "名（全角）が空だと登録できない" do
        @user.last_name_kanji = ''
        @user.valid?
        expect(@user.errors.full_messages).to include "Last name kanji can't be blank"
      end
      it "名（全角）に半角文字が含まれていると登録できない" do
        @user.last_name_kanji = 'a'
        @user.valid?
        expect(@user.errors.full_messages).to include "Last name kanji is invalid"
      end

      #姓・名（カナ）
      it "姓（カナ）が空だと登録できない" do
        
        @user.first_name_kana = ''
        @user.valid?
        expect(@user.errors.full_messages).to include "First name kana can't be blank"
      end

      it "・姓（カナ）にカタカナ以外の文字（平仮名・漢字・英数字・記号）が含まれていると登録できない" do
        
        @user.first_name_kana = 'あ亜１！'
        @user.valid?
        expect(@user.errors.full_messages).to include "First name kana is invalid"
      end

      it "名（カナ）が空だと登録できない" do
        @user.last_name_kana = ''
        @user.valid?
        expect(@user.errors.full_messages).to include "Last name kana can't be blank"
      end

      it "名（カナ）にカタカナ以外の文字（平仮名・漢字・英数字・記号）が含まれていると登録できない" do
        @user.last_name_kana = 'あ亜１！'
        @user.valid?
        expect(@user.errors.full_messages).to include "Last name kana is invalid"
      end
      
      #生年月日
      it "生年月日が空だと登録できない" do
        @user.date_of_birth = ''
        @user.valid?
        expect(@user.errors.full_messages).to include "Date of birth can't be blank"
      end

    end
  end
end

#nickname
# ・nicknameが空では登録できない
#メールアドレス
# ・メールアドレスが空では登録できない
# ・重複したメールアドレスは登録できない
# ・メールアドレスに@を含まない場合は登録できない
#パスワード
# ・パスワードが空では登録できない
# ・パスワードが6文字未満では登録できない
# ・英字のみのパスワードでは登録できない
# ・数字のみのパスワードでは登録できない
# ・全角文字を含むパスワードでは登録できない
# ・パスワードとパスワード（確認用）が不一致だと登録できない
#姓・名（全角）
# ・姓（全角）が空だと登録できない
# ・姓（全角）に半角文字が含まれていると登録できない
# ・名（全角）が空だと登録できない
# ・名（全角）に半角文字が含まれていると登録できない
#姓・名（カナ）
# ・姓（カナ）が空だと登録できない
# ・姓（カナ）にカタカナ以外の文字（平仮名・漢字・英数字・記号）が含まれていると登録できない
# ・名（カナ）が空だと登録できない
# ・名（カナ）にカタカナ以外の文字（平仮名・漢字・英数字・記号）が含まれていると登録できない
#生年月日
# ・生年月日が空だと登録できない