class Public::ItemsController < ApplicationController
  before_action :authenticate_end_user!, only: [:show]
  
  # 商品一覧表示
  def index
    @items = Item.where(is_active: true)
  end
  
  # 商品詳細
  def show
    @item = Item.find(params[:id])
    @cart_item = CartItem.new
  end
  
end
