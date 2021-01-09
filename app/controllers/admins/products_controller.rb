class Admins::ProductsController < ApplicationController
  
  before_action :authenticate_admin!
  
  def index
    @products = Product.all
  end

  def show
    @product = Product.find(params[:id])

  end

  def new
   @product = Product.new
   @genres = Genre.where(is_active: true)
  end

  def create
    product = Product.new(product_params)
    product.save
    redirect_to admins_products_path
  end

  def edit
   @product = Product.find(params[:id])
   @genres = Genre.where(is_active: true)
  end

  def update
    @product = Product.find(params[:id])
    if @product.update(product_params)
    redirect_to admins_products_path(@product)
    end
  end
  
    private
  def product_params
    params.require(:product).permit(:name, :introduction, :price, :genre_id, :image, :is_active)
  end
  
end
