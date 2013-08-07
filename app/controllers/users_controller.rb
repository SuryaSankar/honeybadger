class UsersController < ApplicationController
	before_filter :signed_in_user, only: [:edit, :update]
	before_filter :correct_user, only: [:edit, :update]

	def new
		@user = env['omniauth.identity'] ||= User.new
	end

	def create
		@user=User.find_by email: signup_params[:email]
		@user=User.new email: signup_params[:email] if @user.nil?
		@user.assign_attributes name: signup_params[:name], password: signup_params[:password], password_confirmation: signup_params[:password_confirmation]
		@user.authentications << Authentication.create(user_id: @user.id, provider: "identity", uid: @user.id )
		if @user.save  
		      sign_in @user
		      redirect_to root_url, :notice => "Signed up!"  
		else  
		      render "new" 	
		end	
	end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_user
      @user = User.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def signup_params
      params.require(:user).permit(:name, :email, :password, :password_confirmation, :institution, :department)
    end

    def signed_in_user
	redirect_to '/login', notice: "Please sign in" unless signed_in?
    end

    def correct_user
      @user = User.find(params[:id])
      redirect_to(root_url) unless current_user?(@user)
    end
end
