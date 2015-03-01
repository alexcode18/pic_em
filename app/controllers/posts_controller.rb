class PostsController < ApplicationController

	before_action :authenticate

	def index
		@posts = Post.all
		@tags = Tag.all
	end

	def show
		@post = Post.find(params[:id])
		@tags = Tag.all
	end

	def new
		@post = Post.new
		@authors = Author.all
	end

	def create
		post = Post.new(post_params)
		tags = Tag.find(params[:tags])

		tags.each {|tag| post.tags << tag }

		post.author_id = session[:current_user_id]

		if post.valid?
			post.save
			redirect_to posts_path
		else
			render :new
		end
	end

	def edit
		@post = Post.find(params[:id])
		@tags = Tag.all

		if @post.author_id == current_author.id
		else
			redirect_to author_path
		end
	end

	def update
		updatedpost = Post.find(params[:id])
		tags = Tag.find(params[:tags])
		updatedpost.tags = []
		tags.each {|tag| updatedpost.tags << tag }
		
		if updatedpost.update(post_params)
			redirect_to posts_path
		else
			render edit_post_path
		end
	end

	def destroy
		post = Post.find(params[:id])
		if post.destroy
			redirect_to '/posts'
		else
			redirect_to "/posts/#{post.id}"
		end
	end

	private 

	def post_params
		params.require(:post).permit(:title, :words, :author_id, :img_url)
	end

end
