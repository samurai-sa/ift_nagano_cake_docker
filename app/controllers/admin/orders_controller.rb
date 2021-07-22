class Admin::OrdersController < ApplicationController
  
  def index
    @orders = Order.all
  end
  
  def show
    @order = Order.find(params[:id])
    @order_details = @order.order_details
  end
  
  def update
    @order = Order.find(params[:id])
    if @order.update(update_status_params)
      if @order.status == "confirm"
        @order.order_details.each do |order_detail|
          order_detail.making_status = "produce_waiting"
          order_detail.save!
        end
      end
      flash[:notice] = '更新されました。'
      redirect_to admin_order_path(@order)
    else
      @order_details = @order.order_details
      render :show
    end
  end
  
  private
  
  def update_status_params
    params.require(:order).permit(:status)
  end

end
