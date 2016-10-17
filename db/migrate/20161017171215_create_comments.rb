class CreateComments < ActiveRecord::Migration[5.0]
  def change
    create_table :comments do |t|
      t.string :body
      t.references :post, foreign_key: true
      t.integer :author_id
      t.datetime :published_at

      t.index :author_id
 
      t.index :published_at
      t.timestamps
    end
  end
end
