FactoryBot.define do
  factory :user do
    nickname  {"yoshi"}
    email  {"example@gmail.com"}
    password  {"abcd123"}
    first_name  {"よし子"}
    last_name  {"田中"}
    first_name_kana  {"ヨシコ"}
    last_name_kana  {"タナカ"}
    birthday  {Date.today}
    phone_number  {"09011223344"}
  end
end
