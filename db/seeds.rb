# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

# 管理者ユーザー
Admin.create!(
  email: "admin01@example.com",
  password: "admin01"
)

# 会員ダミーデータ
10.times do |n|
  EndUser.create!(
    email: "test#{n + 1}@example.com",
    password: "test0#{n + 1}",
    last_name: "テスト#{n + 1}",
    first_name: "太郎#{n + 1}",
    last_name_kana: "テスト#{n + 1}",
    first_name_kana: "タロウ#{n + 1}",
    postal_code: sprintf('%06d', rand(999999)),
    address: "テスト県ダミー区#{n + 1}",
    telephone_number: sprintf('%011d', rand(99999999999))
  )
end

# ジャンルダミーデータ
Genre.create!(
  [
    {
      name: "和菓子"
    },
    {
      name: "ケーキ"
    },
    {
      name: "クッキー"
    },
    {
      name: "チョコレート"
    }
  ]
)

# 商品ダミーデータ
5.times do |n|
  Item.create!(
    genre_id: rand(1..4),
    name: "ケーキ#{n + 1}",
    image_id: "",
    introduction: "期間限定商品です",
    price: rand(1000..5000),
    is_active: true
  )
end
