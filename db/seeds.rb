standard = User.create!(
  name: 'User',
  email: 'user@example.com',
  password: 'helloworld'
)

10.times do
  User.create!(
    name: Faker::Name.name,
    email: Faker::Internet.email,
    password: 'helloworld'
  )
end

users = User.all

10.times do
  Item.create!(
    name: Faker::Hipster.sentence,
    user: users.sample
  )
end
items = Item.all

puts "#{Item.count} items created"
puts "#{User.count} users created"
