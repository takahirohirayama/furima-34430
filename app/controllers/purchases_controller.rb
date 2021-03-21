class PurchasesController < ApplicationController
  before_action :authenticate_user!, except: :index
  before_action :set_item, only: [:index, :create]

  def index
    @purchase_address = PurchaseAddress.new
  end

  def create
    @purchase_address = PurchaseAddress.new(address_params)
    if @purchase_address.valid?
      @purchase_address.save
      redirect_to root_path
    else
      render :index
    end
  end


  private

  def address_params
    params.require( :purchase_address).permit(:post_cord, :prefecture_id, :city, :address, :building, :phone_num ).merge(user_id: current_user.id, item_id: params[:item_id])
  end

  def set_item
    @item = Item.find(params[:item_id])
  end

end
