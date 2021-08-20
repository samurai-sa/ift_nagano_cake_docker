class Admin::EndUsersController < ApplicationController

  def index
    @end_users = EndUser.all
  end

  def show
    @end_user = EndUser.find(params[:id])
    @orders = @end_user.orders
    @addresses = @end_user.addresses
  end

end
