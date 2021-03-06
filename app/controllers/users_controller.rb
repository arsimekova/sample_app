class UsersController < ApplicationController
  before_filter :signed_in_user, 
                  only: [:index, :edit, :update, :destroy, :following, :followers, :search]
  before_filter :correct_user, only: [:edit, :update]
  
  before_filter :admin_user, only: :destroy

def following
  @title = "Following"
  @user = User.find(params[:id])
  @users = @user.followed_users.paginate(page: params[:page])
  render 'show_follows'
  
end

def followers
  @title = "Followers"
  @user = User.find(params[:id])
  @users = @user.followers.paginate(page: params[:page])
  render 'show_follows'
  
end

def search
  @users = User.search(params[:search])
  render 'search'
end

 def show
 	@user = User.find(params[:id])
  @posts = @user.posts.paginate(page: params[:page])
 end

 def destroy
    User.find(params[:id]).destroy
    flash[:success] = "User destroyed."
    redirect_to users_url
  end

  def new
  	@user = User.new
  end

  def index
    @users = User.paginate(page: params[:page])
  end

  def create
  	@user = User.new(params[:user])
  	#if @user.save
    if @user.save_without_session_maintenance
     # sign_in @user
     # UserMailer.welcome_email(@user).deliver
     @user.deliver_activation_instructions!
  		flash[:success] = "Welcome to Sample App!"
      flash[:success] = "Your account has been created. Please check your e-mail for your account activation instructions!"
  		redirect_to root_path
  	else
  		render 'new'
  	end
  end

  def edit
    #@user = User.find(params[:id])
  end

  def update
    #@user = User.find(params[:id])
    if @user.update_attributes(params[:user])
      flash[:success] = "Profile updated"
      sign_in @user
      redirect_to @user
    else
      render 'edit'
    end
  end

  private


    def correct_user
      @user = User.find(params[:id])
      redirect_to(root_path) unless current_user?(@user)
    end

    def admin_user
      redirect_to(root_path) unless current_user.admin?
    end

end
