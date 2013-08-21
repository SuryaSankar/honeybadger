class Admins::SessionsController < Devise::SessionsController

    def create
	super
	sign_in :user, current_admin.user
    end

    def destroy
	sign_out current_admin.user
	super
    end
end
