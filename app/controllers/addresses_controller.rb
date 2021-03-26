class AddressesController < ApplicationController
  before_action :set_user, only: [:create, :edit, :update, :destroy]
  before_action :set_address, only: [:edit, :upadte, :destroy]

  def index
    @addresses = current_user.addresses
  end

  def new
    @address = @user.addresses.new
  end

  def create  
    @address = @user.addresses.new(address_params)
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
    @user = current_user
  end

  def set_address
    @address = Address.find_by_id(params[:id])
    redirect_to edit_user_path(current_user), notice: "Address not found" unless @address.present?
  end
end
