class UsersController < ApplicationController
  def new
    @user = User.new  # Initialize the user for the form
  end

  def create
    @user = User.new(user_params)
    
    if @user.save
      session[:user_id] = @user.id
      redirect_to places_path, notice: "Account created successfully!"
    else
      render :new
    end
  end
  
  private
  
  def user_params
    params.require(:user).permit(:username, :email, :password)
  end
end