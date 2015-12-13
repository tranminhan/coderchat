module SessionsHelper

  def log_in(user)
    session[:user_id] = user.id
  end 

  def log_out(user)
    session[:user_id] = nil
  end 

  def current_user
    return if session[:user_id].nil?
    @current_user ||= User.find_by(id: session[:user_id])
  end 

  def logged_in?
    !current_user.nil?
  end 


  def logged_in_user
    unless logged_in?
      flash[:warning] = "Please log in"
      redirect_to login_path
    end 
  end 

end
