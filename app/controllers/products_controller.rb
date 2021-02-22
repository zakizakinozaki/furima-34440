class ProductsController < ApplicationController
  before_action :authenticate_user!, except: [:index]

  def index
  end

  def new
    @product = Product.new
  end

  def create
    @product = Product.new(product_params)
    if @product.save
      redirect_to root_path  
    else
      render action: :new
      @product = Product.new(product_params)
    end
  end

  private

  def product_params
    params.require(:product).permit(:name, :description, :price, :category_id, :status_id, :cost_id, :state_id, :day_id, :image).merge(user_id: current_user.id)
  end
end
