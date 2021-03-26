class ContractsController < ApplicationController
  before_action :set_user, only: %i(new create edit update destroy)
  before_action :set_contract, only: %i(edit update destroy)

  def index
    @contracts = current_user.contracts
  end

  def new
    @contract = @user.contracts.new
  end

  def create  
    @contract = @user.contracts.new(contract_params)
    if @contract.save
      flash[:notice] = "Contract created successfully!"
      redirect_to user_contracts_path
    else
      flash.now.alert = "Contract not Created"
      render :new
    end
  end

  def edit; end

  def update    
    if @contract.update(contract_params)
      flash[:notice] = "Contract updated successfully!"
      redirect_to user_contracts_path
    else
      flash.now.alert = "Contract not updated"
      render :edit
    end
  end

  def destroy
    @contract.destroy
    redirect_to user_contracts_path
  end

  private

  def contract_params
    params.require(:contract).permit(:start_date, :end_date, :transaction_id, :amount, :transaction_mode)
  end

  def set_user
    @user = current_user
  end

  def set_contract
    @contract = @user.contracts.find_by_id(params[:id])
    redirect_to edit_user_path(current_user), notice: "Contract not found" unless @contract.present?
  end
end
