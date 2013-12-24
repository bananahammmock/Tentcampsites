class ApplicationController < ActionController::Base
	
	# skip_before_action :require_login, only: [:show]
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception
 

	private
	def require_login
    if current_user == nil
      redirect_to '/blargh' # halts request cycle
    end
  end

	def current_user
		@current_user ||= User.find(session[:user_id]) if session[:user_id]
	end
	helper_method :current_user
end

