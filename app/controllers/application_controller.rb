class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception

  helper_method :authenticate, :current_author, :logged_in

  def authenticate
  	redirect_to login_path unless session[:current_user_id] || 'posts#index' || 'posts#show'
  end

  def current_author
  	Author.find_by_id(session[:current_user_id])
  end

	def logged_in?
		:current_user_id != nil
	end
end
