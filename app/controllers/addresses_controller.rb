class AddressesController < ApplicationController
  before_action :set_user, :set_address

  def index
    @address = current_user.addresses
  end

  def new
    @address = @user.addresses.new
  end

  def create  
    @address = @user.addresses.create(address_params)
    if @address.save
      flash[:notice] = "Address created successfully!"
      redirect_to user_addresses_path
    else
      flash.now.alert = "Not Created"
      render :new
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
    redirect_to user_addresses_path
  end

  private
  def address_params
    params.require(:address).permit(:country, :state, :city, :address, :pincode)
  end

  def set_user
    @user = User.find_by_id(current_user.id)
  end

  def set_address
    @address = Address.find_by_id(params[:id])
  end
end
