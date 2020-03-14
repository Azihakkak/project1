User.destroy_all
u1 = User.create :email => 'azi@ga.co', :password => 'chicken'
u2 = User.create :email => 'josh@gmail.com', :password => 'chiken'
u3 = User.create :email => 'mitch@gmail.com', :password => 'chicken'
puts "#{ User.count } users created."

Post.destroy_all
p1 = Post.create :content => 'Just finished!', :img => 'https://i.pinimg.com/originals/29/ee/3c/29ee3cb14ec17b7db65f795e3151a2ba.jpg'
p2 = Post.create :content => 'Modern twist!', :img => 'https://i.pinimg.com/474x/11/c8/74/11c8744f2a45d8104042715629250db6.jpg'
p3 = Post.create :content => 'Scribble time', :img => 'https://404store.com/2018/08/26/4c356e5656f65be4e08ec163f7a32d05--grey-tattoo-snake-tattoo.jpg'
puts "#{ Post.count } posts created."

Comment.destroy_all
c1 = Comment.create :content => 'Amazing!!'
c2 = Comment.create :content => 'Here is another amazing one', :img => 'https://glaminati.com/wp-content/uploads/2018/11/butterfly-tattoo-black-outline-arm-334x500.jpg'
c3 = Comment.create :content => 'Insane!'
c4 = Comment.create :content => 'Epic!'
c5 = Comment.create :content => 'Cool design.'
puts "#{ Comment.count } comments created."

# Association

puts "Posts and users"
u1.posts << p1
u2.posts << p2
u3.posts << p3
puts "Comments and users"
u1.comments << c2
u2.comments << c1 << c4
u3.comments << c3 << c5
puts "Comments and posts"
p1.comments << c1 << c4
p2.comments << c2
p3.comments << c3 << c5
