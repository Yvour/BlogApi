class CreatePosts < ActiveRecord::Migration[5.0]
  def change
    create_table :posts do |t|
      t.string :title
      t.text :body
      t.integer :author_id
      t.datetime :published_at
      t.index :author_id
      t.index :published_at
      t.index :title
      t.timestamps
    end
  end
end
