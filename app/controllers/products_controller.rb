class ProductsController < ApplicationController
  before_action :authenticate_user!, except: [:index, :show]
  
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

  def show
    @product = Product.find(params[:id])
  end

  def edit
    @product = Product.find(params[:id])
    redirect_to root_path unless current_user.id == @product.user_id
  end

  def update
    @product = Product.find(params[:id])
    if @product.update(product_params)
      redirect_to product_path(@product)
    else
      render action: :edit
    end
  end

  private

  def product_params
    params.require(:product).permit(:name, :description, :price, :category_id, :status_id, :cost_id, :state_id, :day_id,
                                    :image).merge(user_id: current_user.id)
  end
end
