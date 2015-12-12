module SessionsHelper

  def log_in(user)
    session[:user_id] = user.id
  end 

  def log_out(user)
    session[:user_id] = nil
  end 

  def current_user
    return if session[:user_id].nil?
    @current_user ||= User.find(session[:user_id])
  end 

  def logged_in?
    !current_user.nil?
  end 

end
