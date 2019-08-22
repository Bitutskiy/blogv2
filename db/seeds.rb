# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

5.times do |i|
  User.create(email: "test#{i}@test#{i}.com", password:"123456")
end

5.times do |i|
  User.create(email: "test#{i+5}@test#{i+5}.com", password:"123456", subscribtion:"daily")
end

5.times do |i|
  User.create(email: "test#{i+10}@test#{i+10}.com", password:"123456", subscribtion:"without")
end

10.times do |i|
  Post.create(title: "Post##{i}", body:"Post##{i} Post##{i} Post##{i} Post##{i} Post##{i}", user_id: 1, created_at:"2019-08-2#{i} 02:22:43.178640")
end
