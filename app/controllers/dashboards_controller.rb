class DashboardsController < ApplicationController
  before_action :logged_in_user, only: [:index, :show]
  
  def show 
  end 

end
