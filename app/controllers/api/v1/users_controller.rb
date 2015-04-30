class Api::V1::UsersController < Api::V1::ApiController
  # GET /api/v1/users
  def index
    @users = Cashbox.where(macaddress: params[:macaddress])[0].store.client.users #mejorar
  end


  # GET /api/v1/users/1
  def show
    @user = User.find(params[:id])
  end
end