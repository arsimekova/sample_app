class CommentsController < ApplicationController
	 before_filter :signed_in_user
  	

  	def create
      @post = Post.find(params[:post_id])
      @comment = @post.comments.build(params[:comment])
      @comment.user = current_user
	  	
      if @comment.save
	  		flash[:success] = "Comment added!"
	  		redirect_to post_path(@post)
	  	else
	  		#@feed_items =[]
	  		flash[:error] = "Something went wrong! Comment was not added!"
	  		render 'static_pages/home'
	  	end
  	end

  	def destroy
  		@comment.destroy
  		redirect_to root_url
  	end



  private

 
end
