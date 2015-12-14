class AddAttachmentToMessages < ActiveRecord::Migration
  def up
    add_attachment :messages, :attachment
  end

  def down
    remove_attachment :messages, :attachment
  end
end
