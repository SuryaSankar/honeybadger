class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception
  helper_method :admin?
  helper_method :signed_in?
  helper_method :current_user

  def current_user  
    @current_user ||= User.find(session[:user_id]) if session[:user_id]  
  end 
  
  def signed_in?
    !session[:user_id].nil?
  end

  def admin?
	if current_user.nil?
		false
	else
		current_user.admin
	end
  end

  def authorize
	if session.nil?
		flash[:error]="Unauthorized access"
		redirect_to root_path
		false
	end
  end
end
