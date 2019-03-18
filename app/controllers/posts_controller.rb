class PostsController < ApplicationController
	def index
		@posts = Post.all
	end

	def create
		@post = Post.create(post_params)
	  redirect_to posts_path
	end

	def show
		set_post
	end

	def new
	end

	def update
	  set_post
	  @post.update(post_params)
	  redirect_to post_path(@post)
	end

	def edit
	  set_post
	end

	private

	def set_post
		@post = Post.find(params[:id])
	end

	def post_params
		params.require(:post).permit(:title, :description)
	end

end
