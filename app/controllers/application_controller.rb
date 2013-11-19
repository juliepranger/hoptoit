class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception
  helper_method :current_user
  before_action :require_login

  def current_user
  	if session[:user_id]
  		@current_user ||= User.find_by(id: session[:user_id]) #caching the current_user for future use, "memo-ization"
  	end
  end

  def authenticate_user
		redirect_to authentications_url unless current_user
	end
	
  def index
  end

  private

  def require_login
    unless current_user
      redirect_to authentications_new_url
    end
  end
end
