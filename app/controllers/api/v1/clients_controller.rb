class Api::V1::ClientsController < Api::V1::ApiController
	before_action :set_client, only: [:show]

  # GET /api/v1/clients
  # def index
  #   @clients = Client.all
  # end

  # # GET /api/v1/clients/1
  # def show
  # end

  # private
  # 	def set_client
  # 		@client = Client.find(params[:id])
  # 	end
end
