class ApplicationController < ActionController::Base

  def current_user
    @user = User.find_by(id: session[:user_id])
  end
  
  def set_session
    session[:user_id] = @user.id
  end

  def logged_in?
    !current_user.nil?
  end

end
