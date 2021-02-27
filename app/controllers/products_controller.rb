class ProductsController < ApplicationController
  before_action :authenticate_user!, except: [:index, :show]
  before_action :set_params, only: [:show, :edit, :update]
  before_action :move_to_root, only: [:edit, :update]
  before_action :move_to_redirect, only: :edit

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
  end

  def edit
  end

  def update
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

  def set_params
    @product = Product.find(params[:id])
  end

  def move_to_root
    redirect_to root_path unless current_user.id == @product.user_id
  end

  def move_to_redirect
    redirect_to root_path if @product.purchase.present?
  end
end
