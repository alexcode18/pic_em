class TagsController < ApplicationController

	def index
		@tags = Tag.all
		@posts = Post.all
		@tag = Tag.new
	end

	def show
		@posts = Post.all
		@tag = Tag.find(params[:id])
	end

	#Add a tag to the tags page

	def create
		tag = Tag.new(tag_params)
		if tag.valid?
			tag.save
		end
		redirect_to tags_path
	end

	private

	def tag_params
		params.require(:tag).permit(:name)
	end

end

