class ProductsController < ApplicationController
  
  def index; end

  def new
    @product = Product.new
  end

  def create
    @product = Product.new(product_params)
    if @product.save
      flash[:notice] = 'Product created successfully'
      redirect_to products_path
    else
      flash[:error] = 'Could not create product'
      render :new, status: :unprocessable_entity
    end
  end

  def subcategory
    @sub_categories ||= MainCategory.find_by(id: params[:id]).sub_categories
  end

  private

    def product_params
      params.require(:product).permit(:name, :description, :price, :main_category_id)
      .merge(sub_category_id: params[:sub_category_id], quantity: 0)
    end
end