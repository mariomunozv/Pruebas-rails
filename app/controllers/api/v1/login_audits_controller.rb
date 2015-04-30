class Api::V1::LoginAuditsController < Api::V1::ApiController
  before_action :set_login_audit, only: [:show, :edit, :update, :destroy]

  # GET /login_audits/1
  def show
  end

  def index
    @login_audits = []
  end

  # POST /login_audits
  def create
    if LoginAudit.where(id: params[:id]).length != 0
      set_login_audit
      if @login_audit.update(login_audit_params)
        render :json => "200", status:200
      else
        render :json => "401", status:401
      end
    else
      @login_audit = LoginAudit.new(login_audit_params)
      if not @login_audit.save
        render :json => "401", status:401
      else
        render :json => "200", status:200
      end
    end
  end

  # PATCH/PUT /sales/1
  def update
  end

  def borrar
    login_audits = LoginAudit.all
    login_audits.each do |la|
      la.remove
    end
    redirect_to action: 'index'
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_login_audit
      @login_audit = LoginAudit.find(params[:id])
    end

    # Only allow a trusted parameter "white list" through.
    def login_audit_params
      params.require(:login_audit).permit(:_id, :user_id, :startTime, :endTime, :cashbox_id)
    end
end
