class MessagesController < ApplicationController
  before_action :logged_in_user, only: [:index, :show]

  def show
    message = Message.find_by(id: params[:id])
    if message.nil?
      flash.now[:error] = "Message not found"
    elsif message.receiver != current_user
      flash.now[:error] = "The message is not for you, or you might need to log in to a different account"
    elsif message.read
      flash.now[:warning] = "The message was read on #{pretty_time(message.read_at)}"
    else 
      message.mark_as_read
      @message = message
    end
  end

  def create
    receiver = User.find_by(username: params[:message][:receiver])
    Message.create(receiver: receiver, body: params[:message][:body])
    redirect_to dashboard_path
  end 
end
