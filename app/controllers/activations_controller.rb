class ActivationsController  < ApplicationController
#	before_filter :require_no_user
def create
	@user = User.find_using_perishable_token(params[:activation_code], 1.week) || (raise Exeption)
	raise Exception if @user.active?

	if @user.activate!
		flash[:success] = "Your account has been activated!"
		sign_in @user
		redirect_to @user
	else
		flash[:error] = "Sorry! Your account has not been activated!"
		redirect_to root_url
	end	
end

end
