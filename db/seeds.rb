# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)


u1 = User.create({nickname: 'donald', email: 'donald@duck.com',  password: 'dsfd'})
u2 = User.create({nickname: 'TitusGroan', email: 'TitusGrand@gormenghast.com', password: 'dsfd'})


p1 = Post.new
p1.title = 'North'
p1.body = 'North is cold'
p1.published_at = Time.now
p1.author = u1
p1.save 