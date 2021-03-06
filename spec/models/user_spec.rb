require 'rails_helper'

RSpec.describe User, type: :model do
  before do
    @user = FactoryBot.build(:user)
  end

  describe 'ユーザー新規登録' do
    context '新規登録できるとき' do
      it 'nicknameとemail、passwordとpassword_confirmation、family_nameとgive_name,family_name_kanaとgive_name_kana、birthdayが存在すれば登録できる' do
        expect(@user).to be_valid
      end
      it 'nicknameが40文字以下であれば登録できる' do
        @user.nickname = 'test'
        expect(@user).to be_valid
      end
      it 'passwordとpassword_confirmationが半角英数字で6文字以上存在すれば登録できる' do
        @user.password = '000000a'
        expect(@user).to be_valid
      end
    end
    context '新規登録できないとき' do
        it 'nicknameが空では登録できない' do
          @user.nickname = ''
          @user.valid?
          expect(@user.errors.full_messages).to include "Nickname can't be blank"
        end
        it 'emailが空だと登録できない' do
          @user.email = ''
          @user.valid?
          expect(@user.errors.full_messages).to include "Email can't be blank"
        end
        it '重複したemailの場合は登録できない' do
          @user.save
          another_user = FactoryBot.build(:user)
          another_user.email = @user.email
          another_user.valid?
          expect(another_user.errors.full_messages).to include "Email has already been taken"
        end
        
        it 'emailに@がない場合は登録できない' do
          @user.email = 'hogehuga.com'
          @user.valid?
          expect(@user.errors.full_messages).to include "Email is invalid"
        end
        it 'passwordが空だと登録できない' do
          @user.password = ''
          @user.valid?
          expect(@user.errors.full_messages).to include "Password can't be blank"
        end
        it 'passwordが数値のみでは登録できない' do
          @user.password = '123456'
          @user.valid?
          expect(@user.errors.full_messages).to include "Password confirmation doesn't match Password"
        end
        it 'passwordが英字のみでは登録できない' do
          @user.password = 'hogehoge'
          @user.valid?
          expect(@user.errors.full_messages).to include "Password confirmation doesn't match Password"
        end
        it 'passwordが全角では登録できない' do
          @user.password = 'HOGE'
          @user.valid?
          expect(@user.errors.full_messages).to include "Password is invalid"
        end
        it 'family_nameが空だと登録できない' do
          @user.family_name = ''
          @user.valid?
          expect(@user.errors.full_messages).to include "Family name can't be blank"
        end
        it 'family_nameが英語だと登録できない' do
          @user.family_name = 'kana'
          @user.valid?
          expect(@user.errors.full_messages).to include "Family name is invalid"
        end
        it 'family_nameが数字だと登録できない' do
          @user.family_name = 11
          @user.valid?
          expect(@user.errors.full_messages).to include "Family name is invalid"
        end
        it 'give_nameが空だと登録できない' do
          @user.give_name = ''
          @user.valid?
          expect(@user.errors.full_messages).to include "Give name can't be blank"
        end
        it 'give_nameが英語だと登録できない' do
          @user.give_name = 'kana'
          @user.valid?
          expect(@user.errors.full_messages).to include "Give name is invalid"
        end
        it 'give_nameが数字だと登録できない' do
          @user.give_name = 11
          @user.valid?
          expect(@user.errors.full_messages).to include "Give name is invalid"
        end
        it 'family_name_kanaが空だと登録できない' do
          @user.family_name_kana = ''
          @user.valid?
          expect(@user.errors.full_messages).to include "Family name kana can't be blank"
        end
        it 'family_name_kanaが数字だと登録できない' do
          @user.family_name_kana = '11'
          @user.valid?
          expect(@user.errors.full_messages).to include "Family name kana is invalid"
        end
        it 'family_name_kanaが英語だと登録できない' do
          @user.family_name_kana = 'kana'
          @user.valid?
          expect(@user.errors.full_messages).to include "Family name kana is invalid"
        end
        it 'family_name_kanaが半角カタカナだと登録できない' do
          @user.family_name_kana = ''
          @user.valid?
          expect(@user.errors.full_messages).to include "Family name kana is invalid"
        end
        it 'give_name_kanaが空だと登録できない' do
          @user.give_name_kana = ''
          @user.valid?
          expect(@user.errors.full_messages).to include "Give name kana can't be blank"
        end
        it 'give_name_kanaが数字だと登録できない' do
          @user.give_name_kana = 11
          @user.valid?
          expect(@user.errors.full_messages).to include "Give name kana is invalid"
        end
        it 'give_name_kanaが英語だと登録できない' do
          @user.give_name_kana = 'kana'
          @user.valid?
          expect(@user.errors.full_messages).to include "Give name kana is invalid"
        end
        it 'give_name_kanaが半角カタカナだと登録できない' do
          @user.give_name_kana = 'ｶﾅ'
          @user.valid?
          expect(@user.errors.full_messages).to include "Give name kana is invalid"
        end
        it 'birthdayが空だと登録できない' do
          @user.birthday = ''
          @user.valid?
          expect(@user.errors.full_messages).to include "Birthday can't be blank"
        end
    end
  end
end
