# frozen_string_literal: true

class AddUsersRefToPosts < ActiveRecord::Migration[6.1]
  def change
    add_reference :posts, :posts, null: false, foreign_key: true
  end
end
