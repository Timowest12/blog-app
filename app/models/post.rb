class Post < ApplicationRecord
  belongs_to :author, class_name: 'User', foreign_key: :user_id
  has_many :likes
  has_many :comments
  validates :title, presence: true, length: { maximum: 250 }


  def five_last_comments
    comments.order(created_at: :desc).limit(5)
  end

  after_save :update_posts_counter

  def update_posts_counter
    author.increment!(:posts_counter)
  end
end
