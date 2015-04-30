class Api::V1::CashRegistersController < Api::V1::ApiController
  before_action :set_cash_register, only: [:show, :edit, :update, :destroy]

  # GET /cash_registers
  def index
    @cash_registers = CashRegister.where(cashbox:Cashbox.where(macaddress: params[:macaddress]).first).order('created_at DESC').limit(1)
  end

  # GET /cash_registers/1
  def show
  end

  # POST /cash_registers
  def create
    @cash_register = CashRegister.new(cash_register_params)
    @cash_register.created_at = @cash_register.created_at.to_i / 1000 #truco sucio
    if not @cash_register.save
      render :json => "401", status:401
    else
      render :json => "201", status:201
    end
  end

  # PATCH/PUT /cash_registers/1
  def update
    if @cash_register.update(cash_register_params)
      redirect_to @cash_register
    else
      render :edit
    end
  end

  # DELETE /cash_registers/1
  def destroy
    @cash_register.destroy
    redirect_to cash_registers_url
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_cash_register
      @cash_register = CashRegister.find(params[:id])
      if @cash_register == nil
        render :json => "401", status:401
      end
    end

    # Only allow a trusted parameter "white list" through.
    def cash_register_params
      params.require(:cash_register).permit(:_id, :user_id, :created_at, :amount, :type, :cashbox_id)
    end
end
