class CommentsController < ApplicationController
	 before_filter :signed_in_user
  	#before_filter :correct_post, only: :destroy

  	def create
		@post = Post.find_by_id(params[:posts_id].to_i)
		#params[:new_param] = @post
   		@comment = @post.comments.build(params[:comment])
    	
	  	#if @comment.save
	  	#	flash[:success] = "Comment added!"
	  	#	redirect_to root_url
	  	#else
	  		#@feed_items =[]
	  	#	render 'static_pages/home'
	  	#end
  	end

  	def destroy
  		@comment.destroy
  		redirect_to root_url
  	end

  private

  #def correct_post
  #	@post_id = (current_user.posts.find_by_id(params[:id])).id
  	#redirect_to root_url if @comment.nil?
  #end
end
