class Users::RegistrationsController < Devise::RegistrationsController
	def append_or_create
	    @user = User.find_by email: sign_up_params[:email]
	    if @user.nil?
	  	create
	    else
                @user.authentications.create provider: "karpeer", uid: @user.id
		sign_in_and_redirect @user, event: :authentication #this will throw if @user is not activated
		flash[:notice]="You have successfully logged in"
	    end
	end
end
