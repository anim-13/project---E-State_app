class AddressesController < ApplicationController
  def index
    @address = current_user.addresses
  end

  def new
    @user = User.find(current_user.id)
    @address = @user.addresses.new
  end

  def create
    @user = User.find(current_user.id)
    @address = @user.addresses.create(address_params)
    if @address.save
      flash[:notice] = "Address created successfully!"
      redirect_to root_path
    else
      flash.now.alert = "Not Created"
      render :new
    end
  end

  def edit
    @user = User.find(current_user.id)
    @address  = current_user.addresses.find(params[:id])
  end

  def update    
    @user = User.find(current_user.id)
    @address = Address.find(params[:id])
    if @address.update(address_params)
      redirect_to root_path
    else
      render :edit
    end
  end

  def destroy
    @address = Address.find(params[:id])
    @address.destroy

    redirect_to root_path
  end

  private
  def address_params
    params.require(:address).permit(:country, :state, :city, :address, :pincode)
  end
end
