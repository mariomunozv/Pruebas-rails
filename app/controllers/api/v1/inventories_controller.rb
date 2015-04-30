class Api::V1::InventoriesController < Api::V1::ApiController
  before_action :set_inventory, only: [:show, :edit, :update, :destroy]

  # GET /inventories
  def index
    @inventories = Inventory.where(store:Cashbox.where(macaddress: params[:macaddress]).first.store).order('created_at DESC').limit(5)
  end

  # GET /inventories/1
  def show
  end

  # POST /inventories
  def create
    @inventory = Inventory.new(inventory_params)
    @inventory[:details] = params[:details]
    @inventory.created_at = @inventory.created_at.to_i / 1000 #truco sucio
    if not @inventory.save
      render :json => "401", status:401
    else
      redirect_to @inventory
    end
  end

  # PATCH/PUT /inventories/1
  def update
    if @inventory.update(inventory_params)
      redirect_to @inventory, notice: 'inventory was successfully updated.'
    else
      render :edit
    end
  end

  # DELETE /inventories/1
  def destroy
    @inventory.destroy
    redirect_to inventories_url, notice: 'inventory was successfully destroyed.'
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_inventory
      @inventory = Inventory.find(params[:id])
      if @inventory == nil
        render :json => "401", status:401
      end
    end

    # Only allow a trusted parameter "white list" through.
    def inventory_params
      params.require(:inventory).permit(:_id, :user_id, :details, :created_at, :store_id)
    end
end
