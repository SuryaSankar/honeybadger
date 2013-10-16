class Users::RegistrationsController < Devise::RegistrationsController
	def append_or_create
	    @user = User.find_by email: sign_up_params[:email]
	    if @user.nil?
	  	create
	    else
                @user.authentications.create provider: "karpeer", uid: @user.id
		if @user.update_attributes(uname: sign_up_params[:uname], password: sign_up_params[:password] , password_confirmation: sign_up_params[:password_confirmation]) then
		#sign_in_and_redirect @user, event: :authentication #this will throw if @user is not activated
		#flash[:notice]="You have successfully logged in"
		      if @user.active_for_authentication?
			set_flash_message :notice, :signed_up if is_navigational_format?
			sign_up(:user, @user)
			respond_with @user, :location => after_sign_up_path_for(@user)
		      else
			set_flash_message :notice, :"signed_up_but_#{resource.inactive_message}" if is_navigational_format?
			expire_session_data_after_sign_in!
			respond_with @user, :location => after_inactive_sign_up_path_for(@user)
		      end			
		else
		        clean_up_passwords @user
		        respond_with @user
			#flash[:error] = "Check the details you have provided "
			#redirect_to new_user_session_path
		end
	    end
	end
end
