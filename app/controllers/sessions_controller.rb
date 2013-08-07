class SessionsController < ApplicationController
  def new  
	render
  end  

=begin   
  def create  
    user = User.find_by(username: params[:username]).try(:authenticate, params[:password]) 
    #user = User.authenticate(params[:email], params[:password])  
    if user  
      #session[:user_id] = user.id 
	    sign_in user
      	    redirect_to root_url, :notice => "Logged in!"  
    else  
      flash.now.alert = "Invalid email or password"  
      render "new"  
    end  
  end  
=end

  def create
    auth = request.env['omniauth.auth']
 
    # Find an authentication or create an authentication
    @authentication = Authentication.find_with_omniauth(auth)
    if @authentication.nil?
      # If no authentication was found, create a brand new one here
      @authentication = Authentication.create_with_omniauth(auth)
    end
 
    if signed_in?
      if @authentication.user == current_user
        # User is signed in so they are trying to link an authentication with their
        # account. But we found the authentication and the user associated with it 
        # is the current user. So the authentication is already associated with 
        # this user. So let's display an error message.
        redirect_to root_path, notice: "You have already linked this account"
      else
        # The authentication is not associated with the current_user so lets 
        # associate the authentication
        @authentication.user = current_user
        @authentication.save
        redirect_to root_path, notice: "Account successfully authenticated"
      end
    else # no user is signed_in
      if @authentication.user.present?
        # The authentication we found had a user associated with it so let's 
        # just log them in here
        #self.current_user = @authentication.user
	sign_in @authentication.user
        redirect_to root_path, notice: "Signed in!"
      else
        # The authentication has no user assigned and there is no user signed in
        # Our decision here is to create a new account for the user
        # But your app may do something different (eg. ask the user
        # if he already signed up with some other service)
	case @authentication.provider
		when 'identity'
		  puts auth 
		  u = User.find(@authentication.uid)
		  # If the provider is identity, then it means we already created a user
		  # So we just load it up
		when 'facebook'
		  puts "entering facebook block"
		  u = User.find_by email: auth.info.email 
		  # otherwise we have to create a user with the auth hash
		  u = User.create_with_omniauth(auth) if u.nil?
		
		  # NOTE: we will handle the different types of data we get back
		  # from providers at the model level in create_with_omniauth
		when 'google_oauth2'
		  puts "entering oauth2 block"
		  u = User.find_by email: auth.info.email 
		  # otherwise we have to create a user with the auth hash
		  u = User.create_with_omniauth(auth) if u.nil?
		
		  # NOTE: we will handle the different types of data we get back
		  # from providers at the model level in create_with_omniauth
		else
			redirect_to root_path, notice: "Unknown Provider"	
        end
        # We can now link the authentication with the user and log him in
        u.authentications << @authentication
        #self.current_user = u
        sign_in u
        redirect_to root_path, notice: "Welcome to The app!"
      end
    end
  end

  def destroy
      #session[:user_id] = nil  
      cookies.delete(:auth_token) 
      self.current_user = nil
      redirect_to root_url, :notice => "Logged Out" 
  end

  def failure  
    redirect_to root_path, alert: "Authentication failed, please try again."  
  end
end
