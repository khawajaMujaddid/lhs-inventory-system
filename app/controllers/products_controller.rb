# frozen_string_literal: true

class ProductsController < ApplicationController
  before_action :find_product, only: %i[edit update show destroy]

  def index
    @products = Product.all
  end

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

  def edit
    @sub_categories = @product.main_category.sub_categories
  end

  def update
    if @product.update!(update_params)
      flash[:notice] = 'Product updated successfully'
      redirect_to products_path
    else
      flash[:error] = 'Product could not be updated'
      render :edit, status: :unprocessable_entity
    end
  end

  def show; end

  def destroy
    return unless @product.present? && @product.destroy

    flash[:notice] = 'Product was successfully deleted'
    redirect_to products_path
  end

  def subcategory
    @sub_categories ||= MainCategory.find_by(id: params[:id]).sub_categories
  end

  private

  def product_params
    params.require(:product).permit(:name, :description, :price, :main_category_id)
          .merge(sub_category_id: params[:sub_category_id], quantity: 0)
  end

  def update_params
    sub_category_id = get_sub_category_id
    params.require(:product).permit(:name, :description, :price, :main_category_id, :quantity)
    .merge(sub_category_id: sub_category_id)
  end

  def find_product
    @product = Product.find(params[:id])
  end

  def get_sub_category_id
    return params[:sub_category_id] if params[:sub_category_id].present?

    params[:product][:sub_category_id].present? ? params[:product][:sub_category_id] : @product.sub_category_id
  end
end
