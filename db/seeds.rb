# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)
me = User.create(email: 'atran@example.com', username: 'atran', password: 'password', password_confirmation: 'password')
5.times do |n|
  Message.create(body: Faker::Lorem.paragraph, receiver: me)
end 

hacker = User.create(email: 'hacker@example.com', username: 'hacker', password: 'password', password_confirmation: 'password')