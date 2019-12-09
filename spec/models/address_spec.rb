require 'rails_helper'

RSpec.describe Address, type: :model do
  describe '#create' do
    context 'can save' do
      it 'is valid as filling all the conditions' do
        expect(build(:address)).to be_valid
      end

      it 'is valid even if building is missing' do
        expect(build(:address, building: nil)).to be_valid
      end
    end

    context 'can not save' do
      it 'is invalid without post_number' do
        address = build(:address, post_number: nil)
        address.valid?
        expect(address.errors[:post_number]).to include("を入力してください")
      end

      it 'is invalid without prefecture' do
        address = build(:address, prefecture: "---")
        address.valid?
        expect(address.errors[:prefecture]).to include("は予約されています")
      end

      it 'is invalid without city' do
        address = build(:address, city: nil)
        address.valid?
        expect(address.errors[:city]).to include("を入力してください")
      end

      it 'is invalid without address' do
        address = build(:address, address: nil)
        address.valid?
        expect(address.errors[:address]).to include("を入力してください")
      end

      it 'is invalid as no "-" between post_number' do
        address = build(:address, post_number: "1234567")
        address.valid?
        expect(address.errors[:post_number]).to include("は不正な値です")
      end

      it 'is invalid as alphabets in post_number' do
        address = build(:address, post_number: "12a-4567")
        address.valid?
        expect(address.errors[:post_number]).to include("は不正な値です")
      end

    end
  end
end
