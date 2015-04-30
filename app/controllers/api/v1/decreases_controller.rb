class Api::V1::DecreasesController < Api::V1::ApiController
  before_action :set_decrease, only: [:show, :edit, :update, :destroy]

  # GET /decreases
  def index
    @decreases = Decrease.where(store:Cashbox.where(macaddress: params[:macaddress]).first.store).order('created_at DESC').limit(5)
  end

  # GET /decreases/1
  def show
  end

  # POST /decreases
  def create
    @decrease = Decrease.new(decrease_params)
    @decrease[:details] = params[:details]
    @decrease.created_at = @decrease.created_at.to_i / 1000 #truco sucio
    if not @decrease.save
      render :json => "401", status:401
    else
      redirect_to @decrease
    end
  end

  # PATCH/PUT /decreases/1
  def update
    if @decrease.update(decrease_params)
      redirect_to @decrease, notice: 'decrease was successfully updated.'
    else
      render :edit
    end
  end

  # DELETE /decreases/1
  def destroy
    @decrease.destroy
    redirect_to decreases_url, notice: 'decrease was successfully destroyed.'
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_decrease
      @decrease = Decrease.find(params[:id])
      if @decrease == nil
        render :json => "401", status:401
      end
    end

    # Only allow a trusted parameter "white list" through.
    def decrease_params
      params.require(:decrease).permit(:_id, :user_id, :details, :created_at, :store_id, :total, :comment)
    end
end
