class CreateMessages < ActiveRecord::Migration
  def change
    create_table :messages do |t|
      t.string :body
      # t.integer :user_id, index: true, foreign_key: true
      t.references :user, index: true, foreign_key: true
      # t.belongs_to :receiver, class_name: "User", index: true, foreign_key: 'receiver_id'

      t.timestamps null: false
    end
  end
end
