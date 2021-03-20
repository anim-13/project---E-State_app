class EstatesController < ApplicationController
  before_action :set_user, only: [:new, :create, :edit, :update, :destroy]
  before_action :set_estate, only: [:edit, :update, :destroy]

  def index
    @estates = current_user.estates
  end

  def new
    @estate = @user.estates.new
  end

  def create  
    @estate = @user.estates.new(estate_params)
    if @estate.save
      flash[:notice] = "Estate created successfully!"
      redirect_to user_estates_path
    else
      flash.now.alert = "Estate not Created"
      render :new
    end
  end
  
  def edit; end

  def update    
    if @estate.update(estate_params)
      flash[:notice] = "Estate updated successfully!"
      redirect_to user_estates_path
    else
      flash.now.alert = "Estate not updated"
      render :edit
    end
  end

  def destroy
    @estate.destroy
    redirect_to user_estates_path
  end

  private
  def estate_params
    params.require(:estate).permit(:name, :address, :area, :bedroom, :hall , :kitchen, :park)
  end

  def set_user
    @user = current_user
  end

  def set_estate
    @estate = @user.estates.find_by_id(params[:id])
  end
end
