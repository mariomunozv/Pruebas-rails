class Api::V1::StoresController < Api::V1::ApiController

  # GET /api/v1/stores/:id?macaddress=:mac
  def show
      @store = Store.find(params[:id])
      if @store.cashboxes.find_index{|a| a.macaddress == params[:macaddress]} == nil
        @store = nil
      end
      if @store == nil
        render :json => "401", status:401
      end
  end
end
