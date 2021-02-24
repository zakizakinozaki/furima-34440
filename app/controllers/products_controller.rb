class ProductsController < ApplicationController
  before_action :authenticate_user!, except: [:index]

  def index
    @products = Product.includes(:user).order(created_at: :desc)
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
    end
  end

  private

  def product_params
    params.require(:product).permit(:name, :description, :price, :category_id, :status_id, :cost_id, :state_id, :day_id,
                                    :image).merge(user_id: current_user.id)
  end
end
