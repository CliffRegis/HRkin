require 'faker'


5.times do
  user = User.new(
    username: Faker::Name.username,
    email:    Faker::Internet.email,
    password: Faker::Lorem.characters(10)
  )
  user.skip_confirmation!
  user.save!
end
users = User.all



 15.times do
   Topic.create!(
     title:         Faker::Lorem.sentence,
     content:  Faker::Lorem.paragraph
   )
 end
 topics = Topic.all


50.times do
  Post.create!(
    user:   users.sample,
    topic:  topics.sample,
    title:  Faker::Lorem.sentence,
    content:   Faker::Lorem.paragraph
  )
end


 100.times do
   Comment.create(
     post: posts.sample,
     user: users.sample,
     body: Faker::Lorem.paragraph
   )
 end

 def make_relationships
  users = User.all
  user  = users.first
  followed_users = users[2..50]
  followers      = users[3..40]
  followed_users.each { |followed| user.follow!(followed) }
  followers.each      { |follower| follower.follow!(user) }
end

 comments = Comment.all


 admin = User.new(
   username:     'Admin User',
   email:    'admin@example.com',
   password: 'helloworld',
   role:     'admin'
 )
 admin.skip_confirmation!
 admin.save!


 moderator = User.new(
   username:     'Moderator User',
   email:    'moderator@example.com', 
   password: 'helloworld',
   role:     'moderator'
 )
 moderator.skip_confirmation!
 moderator.save!

 member = User.new(
   username:     'Member User',
   email:    'member@example.com',
   password: 'helloworld',
 )
 member.skip_confirmation!
 member.save!

puts "Seed finished"
puts "#{User.count} users created"
puts "#{Post.count} posts created"
puts "#{Comment.count} comments created"