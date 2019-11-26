FactoryBot.define do

  factory :user do
    nickname              {"abe"}
    email                 {"kkk@gmail.com"}
    password              {"00000000"}
    password_confirmation {"00000000"}
    first_name            {"田中"}
    last_name             {"正志"}
    first_name_kana       {"タナカ"}
    last_name_kana        {"マサシ"}
    phone_number          {"0000000000"}
    birthday              {"19950804"}
  end

end