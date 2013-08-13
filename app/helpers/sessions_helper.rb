module SessionsHelper
 
  def sign_in(user)
	    if params[:remember_me]  
	      cookies.permanent[:auth_token] = user.auth_token  
	    else  
	      cookies[:auth_token] = user.auth_token    
	    end  
	    self.current_user = user
  end

  def signed_in?
    !!current_user
  end

  def current_user=(user)
    @current_user = user
  end

  def current_user  
    @current_user ||= User.find_by_auth_token(cookies[:auth_token]) if cookies[:auth_token]  
  end

  def admin?
    current_user.is_admin
  end
  
  def authorize
	unless signed_in?
		flash[:error]="Unauthorized access"
		redirect_to root_path
		false
	end
  end

  def authorized_user?(user)
	unless current_user == user
		flash[:error]="Unauthorized access"
		redirect_to root_path
		false
	end
  end

end
