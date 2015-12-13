class Message < ActiveRecord::Base
  belongs_to :receiver, class_name: 'User', foreign_key: 'user_id'
  belongs_to :sender, class_name: 'User', foreign_key: 'sender_id'

  def mark_as_read
    self.read = true
    self.read_at = DateTime.now
    self.save
  end
end
