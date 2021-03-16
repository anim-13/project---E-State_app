class EstatesController < ApplicationController
  before_action :set_user, :set_estate

  def index
    @estate = current_user.estates
  end

  def new
    @estate = @user.estates.new
  end

  def create  
    @estate = @user.estates.create(estate_params)
    if @estate.save
      flash[:notice] = "Estate created successfully!"
      redirect_to user_estates_path
    else
      flash.now.alert = "Not Created"
      render :new
    end
  end
  
  def edit; end

  def update    
    if @estate.update(estate_params)
      redirect_to user_estates_path
    else
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
    @user = User.find_by_id(current_user.id)
  end

  def set_estate
    @estate = Estate.find_by_id(params[:id])
  end
end
