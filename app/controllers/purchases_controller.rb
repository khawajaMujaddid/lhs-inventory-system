class PurchasesController < ApplicationController
  before_action :find_purchase, only: %i[edit update destroy]

  def index
    @purchases = Purchase.all.order(id: :desc)
  end

  def new
    @purchase = Purchase.new
  end

  def create
    @purchase = Purchase.new(purchase_params)
    if @purchase.save
      @purchase.update_product_quantity
      flash[:notice] = 'Purchase was successfully created'
      redirect_to purchases_path
    else
      flash[:error] = 'Could not create purchase'
      render :mew, status: :unprocessable_entity
    end
  end

  def edit; end

  def update
    if @purchase.update!(purchase_params)
      flash[:notice] = 'Purchase was successfully updated'
      redirect_to purchases_path
    else
      flash[:notice] = 'Could not update purchase'
      render :edit, status: :unprocessable_entity
    end
  end

  def destroy
    return unless @purchase.present? && @purchase.destroy

    flash[:notice] = 'Purchase was successfully destroyed'
    redirect_to purchases_path
  end

  private

    def find_purchase
      @purchase = Purchase.find(params[:id])
    end

    def purchase_params
      params.require(:purchase).permit(:quantity, :price, :date_purchased, :product_id)
    end
end