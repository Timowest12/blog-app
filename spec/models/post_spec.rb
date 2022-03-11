require 'rails_helper'

RSpec.describe Post, type: :model do
  createduser = User.create(name: 'Adam', photo: 'https://genericphoto.com/user1', bio: 'Software developer from Taiwan')
    post1 = Post.new(user_id: 1, title: 'post', text: 'This is my testing post', comments_counter:0)
    com1 = Comment.new(user_id: 1, post_id: 1, text: 'Comment1')

    it 'posts counter works' do
      current = post1.comments_counter
      com2 = Comment.new(user_id: 1, post_id: 1, text: 'Comment2')
      expect(post1.comments_counter).to_not eq(current + 1)
    end
end
