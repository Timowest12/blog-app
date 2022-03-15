class Comment < ApplicationRecord
  belongs_to :author, class_name: 'User', foreign_key: :user_id
  belongs_to :post
  after_save :update_comments_counter

  def update_comments_counter
    post.increment!(:comments_counter)
  end

  after_destroy :decrement_comments_counter

  def decrement_comments_counter
    post.decrement!(:comments_counter)
  end
end
