class SessionsController < ApplicationController
  def new
    # just renders the login form
  end

  def create
    @user = User.find_by(email: params["email"])
    if @user && @user.authenticate(params["password"])
      session[:user_id] = @user.id
      redirect_to "/places"
    else
      flash[:alert] = "Invalid email or password"
      redirect_to "/login"
    end
  end

  def destroy
    session[:user_id] = nil
    redirect_to "/login"
  end
end