class ItemsController < ApplicationController
 
  before_action :authenticate_user!, only: [:new, :edit, :destroy]
  before_action :set_item, only: [:edit, :update, :show, :destroy]
  before_action :move_to_edit, only: [:edit]


  def index
    @items = Item.order("created_at DESC")
  end

  def new
    @item = Item.new
  end


  def edit
    if  @item.purchase.present?
      redirect_to root_path
    end
  end

  def update

    @item.update(item_params)
    if @item.save
      redirect_to root_path
    else
      render :edit
    end
  end

  def show
  end

  

  def create
    @item = Item.new(item_params)
    if @item.save
      redirect_to root_path
    else
      render :new
    end
  end

  def destroy 
   if current_user.id == @item.user_id
      @item.destroy
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



  def move_to_edit
    unless current_user.id == @item.user_id
    redirect_to action: :index
    end


  end


  def set_item
    @item = Item.find(params[:id])
  end
end
