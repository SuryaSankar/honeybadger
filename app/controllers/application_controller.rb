class ApplicationController < ActionController::Base
	include ApplicationHelper
	# Prevent CSRF attacks by raising an exception.
	# For APIs, you may want to use :null_session instead.
	protect_from_forgery with: :exception
	before_filter :set_conditionals
	after_filter :store_location

	before_filter :configure_devise_params, if: :devise_controller?

	def configure_devise_params
		devise_parameter_sanitizer.for(:sign_up) do |u|
			u.permit(:uname, :email, :password, :password_confirmation)
		end
	end

	def set_conditionals
		@show_branches_accordion=true
		@show_left_navigation=true
	end

	def store_location
	 # store last url - this is needed for post-login redirect to whatever the user last visited.
	    if (request.fullpath != "/users/sign_in" && \
		request.fullpath != "/users/sign_up" && \
		request.fullpath != "/users/password" && \
		request.fullpath != "/users/password/new" && \
		!request.fullpath.start_with?("/users/password/edit") && \
	        request.fullpath != "/admins/sign_in" && \
		!request.xhr?) # don't store ajax calls
	      session[:previous_url] = request.fullpath 
	    end
	end

	def after_sign_in_path_for(resource)
	  session[:previous_url] || root_path
	end


end
