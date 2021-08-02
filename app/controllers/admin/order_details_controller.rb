class Admin::OrderDetailsController < ApplicationController

  def update
    order_detail = OrderDetail.find(params[:id])
    if order_detail.update(update_making_status_params)
      produce_executed_count = 0
      order_detail.order.order_details.each do |a|
        if a.making_status == "produce_executed"
          produce_executed_count += 1
        else
          break
        end
      end

      if order_detail.making_status == "produce_running"
        order_detail.order.status = "running"
      elsif
        produce_executed_count == order_detail.order.order_details.count
        order_detail.order.status = "shipment_waiting"
      end
      order_detail.order.save!

      # 後置ifを使用
      # order_detail.order.update(status: "shipment_waiting") if order_detail.order.order_details.where(making_status: "produce_executed").count == order_detail.order.order_details.count

      flash[:notice] = '更新されました。'
      redirect_to admin_order_path(order_detail.order_id)
    else
      @order = order_detail.order
      @order_details = @order.order_details
      render "orders/show"
    end
  end

  private

  def update_making_status_params
    params.require(:order_detail).permit(:making_status)
  end

end
