class PurchasesController < ApplicationController
  before_action :authenticate_user!, only: [:index]
  before_action :set_purchase, only: [:index, :create]
 
  def new
  end

  def index
    @purchase_address = PurchaseAddress.new
     if  @item.purchase.present? || current_user.id == @item.user_id
       redirect_to root_path
     end
  end

  def create
    @purchase_address = PurchaseAddress.new(purchase_params)
    if @purchase_address.valid?
      pay_item
      @purchase_address.save
      redirect_to root_path
    else
      render :index
    end 
  end

  private

  def purchase_params
    params.require(:purchase_address).permit(:postal_code, :area_id, :city, :house_number, :building_name, :telephone_number).merge( user_id: current_user.id, token: params[:token], item_id: params[:item_id])
  end

  def pay_item
    Payjp.api_key =ENV["PAYJP_SECRET_KEY"]
    Payjp::Charge.create(
      amount: @item.price,  # 商品の値段
      card: purchase_params[:token],    # カードトークン
      currency: 'jpy'                 # 通貨の種類（日本円）
    )
  end

  def set_purchase
    @item = Item.find(params[:item_id])
  end

end
