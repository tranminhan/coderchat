class Friendship < ActiveRecord::Base
  belongs_to :me, class_name: 'User'
  belongs_to :friend, class_name: 'User'

  validates :me_id, presence: true
  validates :friend_id, presence: true
end
