class Public::OrdersController < ApplicationController
  before_action :cart_item_check, only: [:new, :confirm, :create]

  # 注文情報入力画面(支払方法・配送先の選択)
  def new
    @order = Order.new
    @addresses = current_end_user.addresses
  end

  # 注文情報確認画面
  def confirm
    @order = current_end_user.orders.new
    @order.payment_method = params[:order][:payment_method]
    @order.shipping_cost = 800
    @cart_items = current_end_user.cart_items
    if params[:order][:address_option] == "0"
      @order.postal_code = current_end_user.postal_code
      @order.address = current_end_user.address
      @order.name = current_end_user.last_name + current_end_user.first_name
    elsif params[:order][:address_option] == "1"
      shipment_address = Address.find(params[:order][:registered_address])
      @order.postal_code = shipment_address.postal_code
      @order.address = shipment_address.address
      @order.name = shipment_address.name
    elsif params[:order][:address_option] == "2"
      @order.postal_code = params[:order][:postal_code]
      @order.address = params[:order][:address]
      @order.name = params[:order][:name]
    end
  end

  # 注文確定処理
  def create
    @order = Order.new(order_params)
    @order.save!
    current_end_user.cart_items.each do | cart_item |
      order_detail = OrderDetail.new
      order_detail.order_id = @order.id
      order_detail.item_id = cart_item.item_id
      order_detail.price = cart_item.item.price
      order_detail.amount = cart_item.amount
      order_detail.making_status = "no_running"
      order_detail.save!
    end

    cart_item = current_end_user.cart_items
    cart_item.destroy_all

    redirect_to orders_done_path
  end

  # 注文完了画面
  def done
  end

  # 注文履歴画面
  def index
    @orders = current_end_user.orders
  end

  # 注文履歴詳細画面
  def show
    @order = Order.find(params[:id])
    @order_details = @order.order_details
  end

  private

  def order_params
    params.require(:order).permit(:end_user_id, :postal_code, :address, :name, :shipping_cost, :total_payment, :payment_method, :status)
  end

  def cart_item_check
    cart_item = current_end_user.cart_items
    unless cart_item.exists?
      redirect_to items_path
    end
  end

end
