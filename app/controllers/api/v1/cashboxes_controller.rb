class Api::V1::CashboxesController < Api::V1::ApiController
  # GET /api/v1/cashbox
  def show
    @cashbox = Cashbox.where(macaddress: params[:macaddress])[0]
    if @cashbox== nil
      render :json => "401", status:401
    end
  end
end
