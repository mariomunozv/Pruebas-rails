class Api::V1::SalesController < Api::V1::ApiController
  before_action :set_sale, only: [:show, :update, :destroy]

  # GET /sales
  def index
    @sales = Cashbox.where(macaddress: params[:macaddress])[0].sales.order('created_at DESC').limit(500)
  end

  # GET /sales/1
  def show
  end

  # POST /sales
  def create
    if Sale.where(id: params[:id]).length != 0
      set_sale
      if @sale.update(sale_params)
        redirect_to @sale
      else
        render :json => "401", status:401
      end
    else
      @sale = Sale.new(sale_params)
      @sale[:details] = params[:sale][:details]
      @sale.created_at = @sale.created_at.to_i / 1000 #truco sucio
      if not @sale.save
        render :json => "401", status:401
      else
        redirect_to @sale
      end
    end
  end

  # PATCH/PUT /sales/1
  def update
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_sale
      @sale = Sale.find(params[:id])
      cashbox = Cashbox.find(@sale.cashbox_id.to_s)
      if cashbox[:macaddress] != params[:macaddress]
        @sale = nil
      end
      if @sale == nil
        render :json => "401", status:401
      end
    end

    # Only allow a trusted parameter "white list" through.
    def sale_params
      params.require(:sale).permit(:_id, :user_id, :details, :total, :created_at, :cashbox_id, :cash, :card, :isValid)
    end
end
