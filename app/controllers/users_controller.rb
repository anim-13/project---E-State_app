class UsersController < ApplicationController
  def new
    @user = User.new
  end

  def create
    @user = User.new(user_params)
    if @user.save
      flash[:notice] = "Account created successfully!"
      redirect_to root_path
    else
      flash.now.alert = "Enter valid email and password and try again."
      render :new
    end
  end

  def edit
    @user = User.find(params[:id])
    unless current_user.id == @user.id
      flash.now.alert = "Denied Access!"
      redirect_to login_path
    end
  end

  def update
    @user = User.find(params[:id])
    if @user.update(user_update)
      redirect_to root_url, notice: "Profile updated Successfully"
    else
      render :edit
    end
  end

  private
  def user_params
    params.require(:user).permit(:name, :email, :password, :password_confirmation, :contact)
  end  

  def user_update
    params.require(:user).permit(:name, :contact)
  end
end
