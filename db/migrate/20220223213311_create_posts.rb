class CreatePosts < ActiveRecord::Migration[6.1]
  def change
    create_table :posts do |t|
      t.string :Title
      t.text :test
      t.integer :CommentsCounter
      t.integer :LikesCounter

      t.timestamps
    end
  end
end
