class UsersController < ApplicationController
	def new
		@user=User.new
	end
	def create
		@user=User.new(signup_params)
		if @user.save  
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
      puts params
      params.require(:user).permit(:username, :email, :password, :password_confirmation, :institution, :department)
    end
end
