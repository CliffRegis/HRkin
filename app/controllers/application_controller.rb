class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  include Pundit
  protect_from_forgery with: :exception
  
  #helper_method :current_user

 before_filter :current_user


def current_user
  return unless session[:user_id]
  @current_user ||= User.find(session[:user_id])
end
  


    # def current_user
    #   return unless session[:user_id]
    #   @current_user ||= User.find_by_id(session[:user])
    # end

end
