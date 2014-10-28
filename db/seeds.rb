require 'faker'

Topic.destroy_all
Post.destroy_all
User.destroy_all
Comment.destroy_all


5.times do
  user = User.new(
    username: Faker::Name.name,
    email:    Faker::Internet.email,
    password: Faker::Lorem.characters(10)
  )
  user.skip_confirmation!
  user.save!
end

users = User.all



 15.times do
   Topic.create!(
     title:    Faker::Lorem.sentence,
     content:  Faker::Lorem.paragraph
   )
 end

 topics = Topic.all


50.times do
  post = Post.create!(
    user:   users.sample,
    topic:  topics.sample,
    title:  Faker::Lorem.sentence,
    content:   Faker::Lorem.paragraph
  )
   post.update_attribute(:created_at, rand(10.minutes..1.year).ago)
   post.update_rank
end

posts = Post.all

 100.times do
   Comment.create(
     post: posts.sample,
     user: users.sample,
     content: Faker::Lorem.paragraph
   )
 end
 
comments = Comment.all

 def make_relationships
  users = User.all
  user  = users.first
  followed_users = users[2..50]
  followers      = users[3..40]
  followed_users.each { |followed| user.follow!(followed) }
  followers.each      { |follower| follower.follow!(user) }
end

# Following relationships
# users = User.all
# user  = users.first
# supporting = users[2..50]
# supporters = users[3..40]
# supporting.each { |supported| user.support(supported) }
# supporters.each { |supporter| supporter.support(user) }


 admin = User.new(
   username:     'Admin User',
   email:    'admin@example.com',
   password: 'helloworld',
   # role:     'admin'
 )
 admin.skip_confirmation!
 admin.save!


 moderator = User.new(
   username:     'Moderator User',
   email:    'moderator@example.com', 
   password: 'helloworld',
   #role:     'moderator'
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