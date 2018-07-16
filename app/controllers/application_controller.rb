class ApplicationController < ActionController::Base
  # Prevents CSRF attacks by raising an exception.
  # For API's, you may want to use :null_session instead.
  protect_from_forgery with: :exception

  #TODO @current_user ||= to use memoization in your application, to cache objects on a per-request basis. This way your application will only load the object only once.
  def current_user
    @current_user ||= User.where(id: session[:user_id]).first
  end

  helper_method :current_user
end
