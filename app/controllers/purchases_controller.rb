class PurchasesController < ApplicationController
  before_action :authenticate_user!
  before_action :set_product
  before_action :move_to_root

  def index
    @order = Order.new
  end

  def create
    @order = Order.new(order_params)
    if @order.valid?
      pay_item
      @order.save
      redirect_to root_path
    else
      render :index
    end
  end

  private

  def order_params
    params.require(:order).permit(:postal_code, :city, :address, :building, :phone_num, :state_id).merge(user_id: current_user.id,
                                                                                                                       product_id: params[:product_id], token: params[:token])
  end

  def set_product
    @product = Product.find(params[:product_id])
  end

  def pay_item
    Payjp.api_key = ENV['PAYJP_SECRET_KEY']
    Payjp::Charge.create(
      amount: @product.price,
      card: order_params[:token],
      currency: 'jpy'
    )
  end

  def move_to_root
    redirect_to root_path if current_user.id == @product.user_id || @product.purchase.present? 
  end
end
