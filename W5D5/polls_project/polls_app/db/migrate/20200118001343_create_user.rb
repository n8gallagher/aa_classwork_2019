class CreateUser < ActiveRecord::Migration[5.2]
  def change
    create_table :users do |t|
      t.string :username, limit: 12, null: false
      t.timestamps
    end
    add_index :users, :username, unique: true
  end
end
