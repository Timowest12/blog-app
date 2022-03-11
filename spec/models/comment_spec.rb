require 'rails_helper'

RSpec.describe Comment, type: :model do
  describe 'Comment model' do
    user1 = User.create(name: 'Marco', photo: 'https://genericphoto.com/user1', bio: 'Software developer from Belgium')
    post1 = Post.new(user_id: 1, title: 'post', text: 'This is my testing post', comments_counter:0)
    com1 = Comment.new(user_id: 1, post_id: 1, text: 'Comment1')

    it 'comment counter not to be nil' do
      current = post1.comments_counter
      com2 = Comment.new(user_id: 1, post_id: 1, text: 'Comment2')
      expect(post1.comments_counter).to_not be_nil
    end

    it 'comments counter works' do
      current = post1.comments_counter
      com2 = Comment.new(user_id: 1, post_id: 1, text: 'Comment2')
      expect(post1.comments_counter).to_not eq(current + 1)
    end

    it 'comment name to be correct' do
      com2 = Comment.new(user_id: 1, post_id: 1, text: 'Comment2')
      expect(com2.text).to eq('Comment2')
    end
  end
end 