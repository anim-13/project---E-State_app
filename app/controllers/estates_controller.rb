class EstatesController < ApplicationController
  before_action :set_user, only: %i(new show create edit update destroy)
  before_action :set_estate, only: %i(edit show update destroy)

  def index
    @estates = current_user.estates
  end

  def new
    @estate = @user.estates.new
  end

  def create  
    @estate = @user.estates.new(estate_params)
    respond_to do |format|
      if @estate.save
        flash[:notice] = "Estate created successfully!"
        format.html { redirect_to user_estates_path }
      else
        flash.now.alert = "Estate not Created"
        format.html { render :new }
        format.js
      end
    end
  end

  def show
    @estates = Estate.includes(:contract).references(:contract).where('estate_id IS NULL').where.not(estates: {user_id: current_user})
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
    respond_to do |format|
      format.js
    end 
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
