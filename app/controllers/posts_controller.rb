class PostsController < ApplicationController
  before_filter :signed_in_user
  before_filter :correct_user, only: :destroy

  def create
  	@post = current_user.posts.build(params[:post])
  	if @post.save
  		flash[:success] = "Post created!"
  		redirect_to root_url
  	else
  		@feed_items =[]
  		render 'static_pages/home'
  	end
  end

  def destroy
  	@post.destroy
  	redirect_to root_url
  end

  def show
    @post = Post.find_by_id(params[:id])
    @comment = @post.comments.build
    @comments = @post.comments
  end

  private

  def correct_user
  	@post = current_user.posts.find_by_id(params[:id])
  	redirect_to root_url if @post.nil?
  end
end