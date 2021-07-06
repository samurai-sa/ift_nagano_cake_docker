class Public::AddressesController < ApplicationController
  def index
    @addresses = current_end_user.addresses
    @address = Address.new
  end

  def new
    
  end

  def create
    @address = Address.new(address_params)
    @address.end_user_id = current_end_user.id
    if @address.save!
      flash[:notice] = '登録されました。'
      redirect_to addresses_path
    else
      @addresses = Address.all
      render :index
    end
  end

  def show
  end

  def edit
    @address = Address.find(params[:id])
  end

  def update
    @address = Address.find(params[:id])
    if @address.update!(address_params)
      flash[:notice] = '更新されました。'
      redirect_to addresses_path
    else
      @addresses = Address.all
      render :index
    end
  end

  def destroy
    address = Address.find(params[:id])
    if address.destroy!
      flash[:notice] = '削除されました。'
      redirect_to addresses_path
    else
      @addresses = Address.all
      render :index
    end
  end
  
  private
  
  def address_params
    params.require(:address).permit(:postal_code, :address, :name)
  end
  
end
