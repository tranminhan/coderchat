class MessagesController < ApplicationController
  before_action :logged_in_user, only: [:index, :show]

  def show
    message = Message.find_by(id: params[:id])
    if message.nil?
      flash.now[:error] = "Message not found"
    elsif message.receiver != current_user
      flash.now[:error] = "The message is not for you, or you might need to log in to a different account"
    elsif message.read
      flash.now[:warning] = "The message was read ..."
    else 
      message.read = true
      message.save
      @message = message
    end
  end
end
