# frozen_string_literal: true

class AddPostsRefToLikes < ActiveRecord::Migration[6.1]
  def change
    add_reference :likes, :post, null: false, foreign_key: true
  end
end
