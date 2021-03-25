class UsersController < ApplicationController
  before_action :set_user
  
  def new
    @user = User.new
  end

  def create
    @user = User.new(user_params)
    if @user.save
      UserJob.perform_later(@user)
      flash[:notice] = "Account created successfully!"
      redirect_to root_path
    else
      flash.now.alert = "Enter valid email and password and try again."
      render :new
    end
  end

  def edit
    unless current_user.id == @user.id
      flash.now.alert = "Denied Access!"
      redirect_to login_path
    end
  end

  def update
    if @user.update(user_update)
      UserMailer.with(user: @user).updation_mail.deliver_now
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

  def set_user
    @user = User.find_by_id(params[:id])
  end
end
