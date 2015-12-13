class MessagesController < ApplicationController
  before_action :logged_in_user, only: [:index, :show]

  def show
    @message = Message.find(params[:id])
    @message.read = true
    @message.save
  end
end
