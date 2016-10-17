class CreateUsers < ActiveRecord::Migration[5.0]
  def change
    create_table :users do |t|
      t.string :nickname
      
      t.string :email
      t.string :password
      t.index :nickname
      t.index :email

      t.timestamps
    end
  end
end
