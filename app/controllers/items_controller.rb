class ItemsController < ApplicationController
 
  before_action :authenticate_user!, only: :new

  def index
    @items = Item.order("created_at DESC")
  end

  def new
    @item = Item.new
  end

  def show
    @item = Item.find(params[:id])
  end

  def create
    @item = Item.new(item_params)
    if @item.save
      redirect_to root_path
    else
      render :new
    end
  end

  private

  def item_params
    params.require(:item).permit(:image, :product_name, :description_of_item, :category_id, :situation_id, :pay_for_id,
                                 :area_id, :shipping_data_id, :price).merge(user_id: current_user.id)
  end
end
