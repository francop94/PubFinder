# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
User.create!(name:  "Example User",
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

99.times do |n|
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
  20.times do |n| 
    name = Faker::Name.title
    address = Faker::Address.street_name
    user_id = n+1
    Pub.create!(name: name, 
                address: address,
                user_id: user_id)
end
  users = User.order(:created_at).take(6)
  pubs = Pub.order(:created_at).take(6)
50.times do
  content = Faker::Lorem.sentence(5)
  # users.each { |user| user.microposts.create!(content: content, pub_id: pubs.sample.id) }
  # voglio che per ogni pub creo un micropost, quindi il micropost appartiene al suo proprietario
  pubs.each {|pub| pub.microposts.create!(content: content, user_id: pub.user.id)}
end

  users = User.order(:created_at).take(6)
  pubs = Pub.order(:created_at).take(6)
  25.times do
    content = Faker::Lorem.sentence(7)
    users.each{ |user| user.reviews.create!(content: content, pub_id: pubs.sample.id) }
end
# sto creando alcune risposte
  reviews = Review.order(:created_at).take(88)
  for i in (0..5) do
    content = "This is an answer "+i.to_s+'.'
    reviews.each {|review| review.answers.create!(content: content, user_id: review.user.id)}
end
# sto validando alcuni pub
  pubs = Pub.all
  for i in (1..10) do
    pubs.sample.validatee
end







