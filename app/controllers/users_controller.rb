class UsersController < ApplicationController
  def new
  end

  def create
    @user = User.new
    @user["username"] = params["username"]
    @user["email"] = params["email"]
    @user["password"] = params["password"]
    @user.save
    
    if @user.save
      # Log the user in after successful signup
      session[:user_id] = @user.id
    redirect_to "/places" 
    
  else
      # If there are validation errors, re-render the signup form
      render :new
    end
  end
end
