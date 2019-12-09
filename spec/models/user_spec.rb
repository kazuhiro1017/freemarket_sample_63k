require 'rails_helper'

RSpec.describe User, type: :model do
  describe '#create' do
    context 'can save' do
      it 'is valid as filling all the conditions' do
        expect(build(:user)).to be_valid
      end
    end

    context 'can not save' do
      it 'is invalid without nickname' do
        user = build(:user, nickname: nil)
        user.valid?
        expect(user.errors[:nickname]).to include("can't be blank")
      end

      it 'is invalid without email' do
        user = build(:user, email: nil)
        user.valid?
        expect(user.errors[:email]).to include("can't be blank")
      end

      it 'is invalid without password' do
        user = build(:user, password: nil)
        user.valid?
        expect(user.errors[:password]).to include("can't be blank")
      end

      it 'is invalid without first_name' do
        user = build(:user, first_name: nil)
        user.valid?
        expect(user.errors[:first_name]).to include("can't be blank")
      end

      it 'is invalid without last_name' do
        user = build(:user, last_name: nil)
        user.valid?
        expect(user.errors[:last_name]).to include("can't be blank")
      end

      it 'is invalid without first_name_kana' do
        user = build(:user, first_name_kana: nil)
        user.valid?
        expect(user.errors[:first_name_kana]).to include("can't be blank")
      end

      it 'is invalid without last_name_kana' do
        user = build(:user, last_name_kana: nil)
        user.valid?
        expect(user.errors[:last_name_kana]).to include("can't be blank")
      end

      it 'is invalid without birthday' do
        user = build(:user, birthday: nil)
        user.valid?
        expect(user.errors[:birthday]).to include("can't be blank")
      end

      it 'is invalid without phone_number' do
        user = build(:user, phone_number: nil)
        user.valid?
        expect(user.errors[:phone_number]).to include("can't be blank")
      end

      it 'is invalid as alphabets in first_name' do
        user = build(:user, first_name: "abc")
        user.valid?
        expect(user.errors[:first_name]).to include("is invalid")
      end

      it 'is invalid as kanjis in first_name_kana' do
        user = build(:user, first_name_kana: "紀夫")
        user.valid?
        expect(user.errors[:first_name_kana]).to include("is invalid")
      end

      it 'is invalid as less than 7 letters in password' do
        user = build(:user, password: "papapa")
        user.valid?
        expect(user.errors[:password]).to include("is invalid")
      end

      it 'is invalid as no @ in email' do
        user = build(:user, email: "thisis.email")
        user.valid?
        expect(user.errors[:email]).to include("is invalid")
      end

      it 'is invalid as alphabets in phone_number' do
        user = build(:user, phone_number: "09012ab34de")
        user.valid?
        expect(user.errors[:phone_number]).to include("is invalid")
      end

      it "is invalid with a duplicate email address" do
        user = create(:user)
        another_user = build(:user, email: user.email)
        another_user.valid?
        expect(another_user.errors[:email]).to include("has already been taken")
      end
      
    end
  end
end
