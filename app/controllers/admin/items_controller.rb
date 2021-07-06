class Admin::ItemsController < ApplicationController

  def index
    if params[:search].present?
      @items = Item.where('name LIKE ?',"%#{params[:search]}%")
    else
      @items = Item.all
    end
  end

  def show

  end

  def new
    @item = Item.new
  end

  def create
    @item = Item.new(item_params)
    if @item.save
      flash[:notice] = '商品を新規作成しました。'
      redirect_to admin_item_path(@item)
    else
      render :new
    end
  end

  def edit
  end

  private

  def item_params
    params.require(:item).permit(:genre_id, :name, :image, :introduction, :price, :is_active)
  end

end
