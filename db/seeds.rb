# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
p "create Users"
User.create!(
  id: 1,
  email: '11111@example.com',
  password: '1111111111',
  name: 'テストユーザー',
  self_introduction: 'テストユーザーです',
  gender: 2,
  profile_photo: open("#{Rails.root}/db/dummy_img/test_1.jpg"),
  sports_event: 1,
  sports_stage: 2,
  sports_level: 3,
  area: 7
)

User.create!(
  id: 2,
  email: 'aaaaa@example.com',
  password: 'aaaaaaaaaa',
  name: 'テストユーザーA',
  self_introduction: 'テストユーザーAです',
  gender: 1,
  profile_photo: open("#{Rails.root}/db/dummy_img/test_2.jpg"),
  sports_event: 2,
  sports_stage: 3,
  sports_level: 2,
  area: 17
)

Post.create!(
  id: 1,
  caption: 'テスト投稿',
  user_id: 2
)

Movie.create!(
  video: open("#{Rails.root}/db/dummy_video/test.mp4"),
  post_id:1
)

ChatRoom.create!(
  id: 1
)

ChatRoomUser.create!(
  chat_room_id: 1,
  user_id: 1
)

ChatRoomUser.create!(
  chat_room_id: 1,
  user_id: 2
)

ChatMessage.create!(
  id: 1,
  chat_room_id: 1,
  user_id: 1,
  message: 'こんにちはAさん'
)

ChatMessage.create!(
  id: 2,
  chat_room_id: 1,
  user_id: 2,
  message: 'こんにちはテストユーザーさん'
)

ChatMessage.create!(
  id: 3,
  chat_room_id: 1,
  user_id: 2,
  message: '合同練習しましょう！'
)

Relationship.create!(
  follower_id: 1,
  following_id: 2
)

