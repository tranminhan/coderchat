class Message < ActiveRecord::Base
  belongs_to :receiver, class_name: 'User', foreign_key: 'user_id'
end
