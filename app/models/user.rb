class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable, :confirmable
  has_many :comments, foreign_key: :user_id
  has_many :posts, foreign_key: :user_id
  has_many :likes, foreign_key: :user_id
  validates :name, presence: true

  def three_recent_post
    posts.order(created_at: :desc).limit(3)
  end

  def admin?(requested_role)
    role == requested_role.to_s
  end
end
