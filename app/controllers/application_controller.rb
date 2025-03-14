class ApplicationController < ActionController::Base
  before_action :current_user

  def current_user
    puts "------------------ code before every request ------------------"
    @current_user = User.find_by(id: session[:user_id])
  end
  
  def authenticate_user
    if @current_user.nil?
      redirect_to "/login", alert: "Please login first"
    end
  end
  
  def logged_in?
    !@current_user.nil?
  end
  helper_method :logged_in?
  helper_method :current_user
end