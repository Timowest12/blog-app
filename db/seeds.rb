# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
user1 = User.create(name: 'Tom', photo: 'https://unsplash.com/photos/F_-0BxGuVvo', bio: 'Teacher from Mexico.')
user2 = User.create(name: 'Lilly', photo: 'https://unsplash.com/photos/F_-0BxGuVvo', bio: 'Teacher from Poland.')
user3 = User.create(name: 'Anna', photo: 'https://unsplash.com/photos/F_-0BxGuVvo', bio: 'Teacher from Poland.')

post1 = Post.create(author: User.first, title: 'Hello', text: 'This is my first post')
post1 = Post.create(author: User.second, title: 'Hello', text: 'This is my second post')
post1 = Post.create(author: User.third, title: 'Hello', text: 'This is my third post')
post1 = Post.create(author: User.first, title: 'Hello all', text: 'This is my fifth post')

comment1 = Comment.create(author: Post.first, user: User.first, text: 'Hi Tom!' )
comment2 = Comment.create(author: Post.first, user: User.first, text: 'Hi Tom!' )
comment3 = Comment.create(author: Post.second, user: User.second, text: 'Hi Marco!' )
comment4 = Comment.create(author: Post.second, user: User.second, text: 'Hi Marco!' )
comment5 = Comment.create(author: Post.third, user: User.third, text: 'Hi Mike!' )
comment6 = Comment.create(author: Post.third, user: User.third, text: 'Hi Mike!' ) 