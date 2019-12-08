FactoryBot.define do
  factory :card do
    card_number  {"0000111122223333"}
    expiry_date  {Date.today}
    security_code  {"123"}
  end
end
