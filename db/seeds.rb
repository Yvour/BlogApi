# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)


u1 = User.create!({nickname: 'donald', email: 'donald@duck.com',  password: 'donaldduck1'})
u2 = User.create!({nickname: 'TitusGroan', email: 'TitusGroan@gormenghast.com', password: 'titusgroan1'})

p = Post.new
p.title = 'About forest'
p.body = 'Trees are not always green'
p.published_at = Time.now
p.author = u2
p.save

i = 0;
while i < 100 do
p1 = Post.new
p1.title = 'North'+i.to_s
p1.body = 'North is cold'+i.to_s
p1.published_at = Time.now
p1.author = u1
p1.save
i=i+1
end