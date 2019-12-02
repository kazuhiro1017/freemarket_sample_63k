10.times do |i|
  User.create!(
    nickname: "hoge#{i + 1}",
    email: "hoge#{i + 1}@example.com",
    first_name: Gimei.first.kanji,
    last_name: Gimei.last.kanji,
    first_name_kana: Gimei.first.hiragana,
    last_name_kana: Gimei.last.hiragana,
    birthday: Faker::Date.birthday(min_age = 18, max_age = 65),
    password: "password")
end