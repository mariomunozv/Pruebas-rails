class Api::V1::ProductsController < Api::V1::ApiController
	before_action :set_product, only: [:show]

  # GET /api/v1/products
  def index
    @products = Cashbox.where(macaddress: params[:macaddress])[0].store.client.products
  end


  # GET /api/v1/products/1
  def show
  end

  private
  	def set_product
  		@product = Product.find(params[:id])
  	end
end
