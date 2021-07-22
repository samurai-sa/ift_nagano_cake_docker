class Public::CartItemsController < ApplicationController
  before_action :authenticate_end_user!
  
  # ショッピングカート表示
  def index
    @cart_items = current_end_user.cart_items
  end
  
  # ショッピングカート内数量変更
  def update
    cart_item = CartItem.find(params[:id])
    if cart_item.update(update_cart_item_params)
      flash[:notice] = '数量が変更されました。'
      redirect_to cart_items_path
    else
      render :update
    end
  end
  
  # カートにアイテム追加
  def create
    @cart_item = CartItem.new(cart_item_params)
    
    current_cart_items = current_end_user.cart_items.find_by(item_id: params[:cart_item][:item_id])
    #current_cart_items = current_end_user.cart_items.exists?(item_id: params[:cart_item][:item_id])
    if current_cart_items.present?
      cart_item = CartItem.find_by(item_id: @cart_item.item_id, end_user_id: current_end_user.id)
      cart_item.update!(amount: cart_item.amount + @cart_item.amount)
      redirect_to cart_items_path
    else
      @cart_item.end_user_id = current_end_user.id
      @cart_item.save!
      redirect_to items_path
    end
    
  end
  
  # カート内商品削除
  def destroy
    cart_item = CartItem.find(params[:id])
    cart_item.destroy!
    flash[:notice] = '削除されました。'
    redirect_to cart_items_path
  end
  
  # カート内商品全削除
  def destroy_all
    cart_items = current_end_user.cart_items
    cart_items.destroy_all
    flash[:notice] = 'カート内を削除しました。'
    redirect_to items_path
  end
  
  private
 
  def cart_item_params
    params.require(:cart_item).permit(:item_id, :end_user_id, :amount)
  end
  
  def update_cart_item_params
    params.require(:cart_item).permit(:amount)
  end

end
