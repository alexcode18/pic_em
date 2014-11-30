class AuthorsController < ApplicationController

		# before_action :logged_in_user, only: [:edit, :update]
	#Index
	def index
		@authors = Author.all
	end

	def new
		@author = Author.new
	end

	def show
		@author = Author.find(params[:id])
	end

	def create
		@author = Author.new(author_params)
		if @author.valid?
			@author.save
			redirect_to authors_path
		else
			render :new
		end
	end

	def edit
		@author = Author.find(params[:id])
	end

	def update
		updated_author = Author.update(params[:id], params[:author])
		updated_author.save
		redirect("/authors/#{updated_author.id}")
	end

	def destroy
		author = Author.find(params[:id])
		if author.destroy
			redirect '/authors'
		else
			redirect "/authors/#{author.id}"
		end
	end

	private

	def author_params
		params.require(:author).permit(:username, :img_url, :bio, :location, :password, :password_confirmation)
	end

	def logged_in_user
		unless logged_in?
			flash[:danger] = "Please log in."
			redirect_to login_path
    end
  end

end

