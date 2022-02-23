class CreatePosts < ActiveRecord::Migration[6.1]
  def change
    create_table :posts do |t|
      t.string :title
      t.text :text
      t.integer :commentscounter
      t.integer :likescounter

      t.timestamps
    end
  end
end
