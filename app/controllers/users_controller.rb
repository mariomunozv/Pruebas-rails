class UsersController < ApplicationController
  before_action :set_user, only: [:show, :edit, :update, :destroy]
  add_breadcrumb "Inicio", :root_path
  add_breadcrumb "Usuarios", :users_path

  # GET /users
  def index
    @users = current_user.client.users.paginate :page => params[:page]
  end

  # GET /users/1
  def show
    add_breadcrumb "Detalle"
  end

  # GET /users/new
  def new
    add_breadcrumb "Nuevo"
    @user = User.new
  end

  # GET /users/1/edit
  def edit
    add_breadcrumb "Editar"
  end

  # POST /users
  def create
    @user = User.new(user_params)

    if @user.save
      redirect_to @user, notice: 'User was successfully created.'
    else
      render :new
    end
  end

  # PATCH/PUT /users/1
  def update
  	if @user.update(user_params)
      redirect_to @user, notice: 'User was successfully updated.'
    else
      render :edit
    end
  end

  # DELETE /users/1
  def destroy
    @user.destroy
    redirect_to users_url, notice: 'User was successfully destroyed.'
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_user
      @user = User.find(params[:id])
    end

    # Only allow a trusted parameter "white list" through.
    def user_params
    	if params[:user][:password] == "" && params[:user][:password_confirmation] == ""
	    	params[:user].delete "password"
	    	params[:user].delete "password_confirmation"
    	end
    	params[:user][:client_id] = current_user.client.id.to_s
      params.require(:user).permit(:name, :lastname, :email, :password, :password_confirmation, :client_id, :role_id)
    end

 end