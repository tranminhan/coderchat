class Message < ActiveRecord::Base
  belongs_to :receiver, class_name: 'User', foreign_key: 'user_id'
  belongs_to :sender, class_name: 'User', foreign_key: 'sender_id'

  has_attached_file :attachment, styles: { medium: "300x300>", thumb: "100x100>" }, default_url: "/images/:style/missing.png"
  validates_attachment_content_type :attachment, content_type: /\Aimage\/.*\Z/

  def mark_as_read
    self.read = true
    self.read_at = DateTime.now
    self.save
  end
end
