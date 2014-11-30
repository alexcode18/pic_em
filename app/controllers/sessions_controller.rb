class SessionsController < ApplicationController

	def new
	end

	def create
		author = Author.find_by(username: params[:username])
		if author && author.authenticate(params[:password])
			session[:current_user_id] = author.id
			redirect_to authors_path
		else
			redirect_to login_path
		end
	end

	def destroy
		session[:current_user_id] = nil
		redirect_to authors_path
	end

end