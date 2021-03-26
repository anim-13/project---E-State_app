class AddressesController < ApplicationController
  before_action :set_user, only: %i(new create edit update destroy)
  before_action :set_address, only: %i(edit show update destroy)

  def index
    @addresses = current_user.addresses
  end

  def new
    @address = @user.addresses.new
  end

  def create  
    @address = @user.addresses.new(address_params)
    respond_to do |format|
      if @address.save
        flash[:notice] = "Address created successfully!"
        format.html { redirect_to user_addresses_path }
      else
        flash.now.alert = "Not Created"
        format.html { render :new }
        format.js
      end
    end
  end

  def edit; end

  def update    
    if @address.update(address_params)
      redirect_to user_addresses_path
    else
      render :edit
    end
  end

  def destroy
    @address.destroy
    respond_to do |format|
      format.js
    end 
  end

  private
  def address_params
    params.require(:address).permit(:country, :state, :city, :address, :pincode)
  end

  def set_user
    @user = current_user
  end

  def set_address
    @address = Address.find_by_id(params[:id])
  end
end
