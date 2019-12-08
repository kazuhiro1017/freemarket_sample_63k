require 'rails_helper'

RSpec.describe Card, type: :model do
  describe '#create' do
    context 'can save' do
      it 'is valid as filling all the conditions' do
        expect(build(:card)).to be_valid
      end
    end

    context 'can not save' do
      it 'is invalid without card_number' do
        card = build(:card, card_number: nil)
        card.valid?
        expect(card.errors[:card_number]).to include("can't be blank")
      end

      it 'is invalid without expiry_date' do
        card = build(:card, expiry_date: nil)
        card.valid?
        expect(card.errors[:expiry_date]).to include("can't be blank")
      end

      it 'is invalid without security_code' do
        card = build(:card, security_code: nil)
        card.valid?
        expect(card.errors[:security_code]).to include("can't be blank")
      end

      it 'is invalid as alphabets in card_number' do
        card = build(:card, card_number: "00001111rrrr3333")
        card.valid?
        expect(card.errors[:card_number]).to include("is invalid")
      end

      it 'is invalid as more than 4 digits in security_code' do
        card = build(:card, security_code: "12345")
        card.valid?
        expect(card.errors[:security_code]).to include("is invalid")
      end
    end
  end
end
