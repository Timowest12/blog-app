# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
user1 = User.create(name: 'Tom', photo: 'https://images.unsplash.com/photo-1508921912186-1d1a45ebb3c1?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=1887&q=80', bio: 'Teacher from Mexico.')
user2 = User.create(name: 'Lilly', photo: 'https://images.unsplash.com/photo-1564558881369-81eaf13b0749?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=687&q=80', bio: 'Teacher from Poland.')
user3 = User.create(name: 'Anna', photo: 'https://images.unsplash.com/photo-1551701256-6e0bf1d3c3e0?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=735&q=80', bio: 'Teacher from Germany.')

post1 = Post.create(user_id: 1, title: 'Hello', text: 'This is my first post')
post2 = Post.create(user_id: 2, title: 'Hello 2', text: 'This is my second post')
post3 = Post.create(user_id: 3, title: 'Hello 3', text: 'This is my third post')

comment1 = Comment.create(post: Post.first, user_id: 1, text: 'Hi Tom!' )
comment2 = Comment.create(post: Post.first, user_id: 1, text: 'Hi Tom!!!!!!!!' )
comment3 = Comment.create(post: Post.second, user_id: 2, text: 'Hi Marco!' )
comment4 = Comment.create(post: Post.second, user_id: 2, text: 'Hi Marco!!!!!!' )
comment5 = Comment.create(post: Post.third, user_id: 3, text: 'Hi Mike!' )
comment6 = Comment.create(post: Post.third, user_id: 3, text: 'Hi Mike!!!!!!!' )  