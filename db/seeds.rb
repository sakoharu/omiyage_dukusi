# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

# Admin.create!(
#   email: "a@a",
#   password: "aaaaaa"
# )

admins = [
  {email: "a@a", password: "aaaaaa"},
]

admins.each do |admin|
  Admin.find_or_create_by(email: admin[:email]) do |a|
    a.password = admin[:password]
  end
end


prefectures = [
  "0": %w(北海道),
  "1": %w(青森県 岩手県 宮城県 秋田県 山形県 福島県),
  "2": %w(新潟県 富山県 石川県 福井県 山梨県 長野県 岐阜県 静岡県 愛知県),
  "3": %w(三重県 滋賀県 京都府 大阪府 兵庫県 奈良県 和歌山県),
  "4": %w(鳥取県 島根県 岡山県 広島県 山口県),
  "5": %w(茨城県 栃木県 群馬県 埼玉県 千葉県 東京都 神奈川県),
  "6": %w(徳島県 香川県 愛媛県 高知県),
  "7": %w(福岡県 佐賀県 長崎県 熊本県 大分県 宮崎県 鹿児島県),
  "8": %w(沖縄県),
]

prefectures.each do |regions|
  regions.each do |region, names|
    names.each do |name|
      Prefecture.find_or_create_by(region: region.to_s.to_i, name: name)
    end
  end
end

genres = %w(食べ物 飲み物 グッズ)
genres.each do |genre|
  Genre.find_or_create_by(genre_name: genre)
end