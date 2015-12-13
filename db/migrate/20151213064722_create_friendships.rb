class CreateFriendships < ActiveRecord::Migration
  def change
    create_table :friendships do |t|
      t.integer :me_id
      t.integer :friend_id

      t.timestamps null: false
    end
    add_index :friendships, :me_id
    add_index :friendships, :friend_id
    add_index :friendships, [:me_id, :friend_id], unique: true
  end
end
