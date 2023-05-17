class MainCategoriesController < ApplicationController
  before_action :find_category, only: %i[edit update]

  def index
    @categories = MainCategory.all
  end

  def new
    @main_category = MainCategory.new
  end

  def create
    @main_category = MainCategory.new(category_params)
    if @main_category.save
      flash[:notice] = 'Category created successfully'
      redirect_to main_categories_path
    else
      flash[:notice] = 'Could not create category'
      render :new, status: :unprocessable_entity
    end
  end

  def edit; end

  def update
    if @main_category.update!(category_params)
      flash[:notice] = 'Updated category'
      redirect_to main_categories_path
    else
      flash[:notice] = 'Failed to update category'
      render :edit, status: :unprocessable_entity
    end
  end

  private

    def find_category
      @main_category = MainCategory.find_by id: params[:id]
    end

    def category_params
      params.require(:main_category).permit(:name, sub_categories_attributes: [:id, :name, :_destroy])
    end
end