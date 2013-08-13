class UsersController < ApplicationController
	before_action :set_user, only: [:show, :edit, :update, :destroy]
	before_filter :signed_in_user, only: [:edit, :update]
	before_filter :correct_user, only: [:edit, :update]
        before_filter :admin_user, only: [:index, :new, :edit, :create, :update, :destroy]
	def index
    		@users = User.all
  	end
	def new
		@user = env['omniauth.identity'] ||= User.new
	end
        
	def show
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
  def edit
  end
def update
    respond_to do |format|
      puts user_params
      if @user.update(user_params)
        format.html { redirect_to @user, notice: 'user was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: 'edit' }
        format.json { render json: @user.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /users/1
  # DELETE /users/1.json
  def destroy
    @user.destroy
    respond_to do |format|
      format.html { redirect_to users_url }
      format.json { head :no_content }
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
      redirect_to(root_url) unless authorized_user?(@user)
    end
end
