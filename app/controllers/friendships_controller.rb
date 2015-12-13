class FriendshipsController < ApplicationController
  def create
    new_friend = User.find_by(id: params[:id])
    if !new_friend
      flash.now[:error] = "Could not find friend"
    else 
      current_user.friends << new_friend
      current_user.save
      redirect_to dashboard_path
    end 
  end 
end
