# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
User.create!(name:  "Administrator",
             email: "example@railstutorial.org",
             password:              "foobar",
             password_confirmation: "foobar",
             admin: true,
             activated: true,
             activated_at: Time.zone.now)

User.create!(name:  "Example User",
             email: "example@olala.org",
             password:              "foobar",
             password_confirmation: "foobar",
             admin: false,
             activated: true,
             activated_at: Time.zone.now)

# users creation
User.create!(name:  "Francesco Gabbani",
             email: "francesco@gmail.com",
             password:              "foobar",
             password_confirmation: "foobar",
             admin: false,
             activated: true,
             activated_at: Time.zone.now)


User.create!(name:  "Francesco Carosi",
             email: "francescoCarosi@gmail.com",
             password:              "foobar",
             password_confirmation: "foobar",
             admin: false,
             activated: true,
             activated_at: Time.zone.now)

User.create!(name:  "Ugo Foscolo",
             email: "ugofo@gmail.com",
             password:              "foobar",
             password_confirmation: "foobar",
             admin: false,
             activated: true,
             activated_at: Time.zone.now)

User.create!(name:  "Amedeo Preziosi",
             email: "amedeopre@gmail.com",
             password:              "foobar",
             password_confirmation: "foobar",
             admin: false,
             activated: true,
             activated_at: Time.zone.now)

User.create!(name:  "Giulia Cantini",
             email: "giuliacani@gmail.com",
             password:              "foobar",
             password_confirmation: "foobar",
             admin: false,
             activated: true,
             activated_at: Time.zone.now)

User.create!(name:  "Francesco Gabbani",
             email: "francescogm@gmail.com",
             password:              "foobar",
             password_confirmation: "foobar",
             admin: false,
             activated: true,
             activated_at: Time.zone.now)

User.create!(name:  "Giorgia Barbanti",
             email: "giobarba@gmail.com",
             password:              "foobar",
             password_confirmation: "foobar",
             admin: false,
             activated: true,
             activated_at: Time.zone.now)

User.create!(name:  "Lucio Dalla",
             email: "dallalucio@gmail.com",
             password:              "foobar",
             password_confirmation: "foobar",
             admin: false,
             activated: true,
             activated_at: Time.zone.now)

42.times do |n|
  name  = Faker::Name.name
  email = "example-#{n+1}@railstutorial.org"
  password = "password"
  User.create!(name:  name,
               email: email,
               password:              password,
               password_confirmation: password,
               activated: true,
               activated_at: Time.zone.now)
end

#pubs and microposts creation
pub = Pub.create!( name: "Irish pub",
             address: "Via Bianchi Leonardo, 7, 00168, Roma",
             user_id: 2)
20.times do
  content = Faker::Lorem.sentence(5)
  pub.microposts.create!(content: content, user_id: pub.user.id)
end

pub = Pub.create!( name: "The old tower pub",
             address: "Via Cola di Rienzo, 21, 00162, Roma",
             user_id: 3)

20.times do
  content = Faker::Lorem.sentence(5)
  pub.microposts.create!(content: content, user_id: pub.user.id)
end

pub = Pub.create!( name: "Elliot pub",
             address: "Via Appiano, 66, 00160, Roma",
             user_id: 4)
20.times do
  content = Faker::Lorem.sentence(5)
  pub.microposts.create!(content: content, user_id: pub.user.id)
end
pub = Pub.create!( name: "Central Perk",
             address: "Via Nomentana, 31, 00160, Roma",
             user_id: 11)
20.times do
  content = Faker::Lorem.sentence(5)
  pub.microposts.create!(content: content, user_id: pub.user.id)
end
pub = Pub.create!( name: "Tennent's pub",
             address: "Via Cassia bis, 3, 00160, Roma",
             user_id: 10)
20.times do
  content = Faker::Lorem.sentence(5)
  pub.microposts.create!(content: content, user_id: pub.user.id)
end
pub = Pub.create!( name: "McLaren's pub",
             address: "Via Appia, 78, 00160, Roma",
             user_id: 9)
20.times do
  content = Faker::Lorem.sentence(5)
  pub.microposts.create!(content: content, user_id: pub.user.id)
end
pub = Pub.create!( name: "Sports pub",
             address: "Via Tiburtina, 7, 00168, Roma",
             user_id: 17)
20.times do
  content = Faker::Lorem.sentence(5)
  pub.microposts.create!(content: content, user_id: pub.user.id)
end
pub = Pub.create!( name: "Shamrock Irish",
             address: "Via Prato della chiesa, 5, 00060, Sacrofano",
             user_id: 18)
20.times do
  content = Faker::Lorem.sentence(5)
  pub.microposts.create!(content: content, user_id: pub.user.id)
end
pub = Pub.create!( name: "Queen Makeda",
             address: "Via Flaminia, 35, 00060, Roma",
             user_id: 22)
20.times do
  content = Faker::Lorem.sentence(5)
  pub.microposts.create!(content: content, user_id: pub.user.id)
end

users = User.all
for pub in Pub.all 
  20.times do
    content = Faker::Lorem.sentence(3)
    vote = rand(1..5)
    users.sample.reviews.create!(content: content, pub_id: pub.id, vote: vote)
  end
end

# sto validando alcuni pub
  pubs = Pub.all
  for i in (1..10) do
    pubs.sample.validatee
end

reviews = Review.all 
100.times do
  review = reviews.sample
  2.times do
    content = Faker::Lorem.sentence(5)
    review.answers.create!(content: content, user_id: User.all.sample.id)
  end
end

