class SessionsController < ApplicationController
  before_action :user_logged_in, if: :current_user, except: :destroy
  
  def new; end

  def create
    user = User.find_by(email: session_params[:email])  
    if user&.authenticate(session_params[:password]) 
      session[:user_id] = user.id
      redirect_to edit_user_path(current_user.id), notice: 'Successfully logged in!'
    else
      flash.now.alert = "Incorrect email or password, try again."
      render :new
    end
  end

  def destroy  
    session.delete(:user_id)
    redirect_to login_path, notice: "Logged out!"
  end

  private
  def session_params
    params.require(:login).permit(:email, :password)
  end

  def user_logged_in
    flash.new.alert = "Already logged in"
    render :new
  end
end
