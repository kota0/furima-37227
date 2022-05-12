class PurchasesController < ApplicationController
  before_action :authenticate_user!, only: [:index]
 
 
  def new
  end

  def index
    @purchase_address = PurchaseAddress.new
    @item = Item.find(params[:item_id])
     if  @item.purchase.present? || current_user.id == @item.user_id
       redirect_to root_path
     end
  end

  def create
    @purchase_address = PurchaseAddress.new(purchase_params)
    @item = Item.find(params[:item_id])
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
    Payjp.api_key ="sk_test_aa30a44726a344f6fb4f14fc"
    Payjp::Charge.create(
      amount: @item.price,  # 商品の値段
      card: purchase_params[:token],    # カードトークン
      currency: 'jpy'                 # 通貨の種類（日本円）
    )
  end
end