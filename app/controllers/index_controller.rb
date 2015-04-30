class IndexController < ApplicationController
	before_filter :authenticate_user!, :except => [:register, :register_create]
	layout "devise", :only => [:register, :register_create]
  add_breadcrumb "Inicio", :root_path

  def home
  end

  # Nuevo Client
  def register
  	@user = User.new
  end

  def dashboard
    add_breadcrumb "Dashboard"
    @data = {
             cashboxes: 3,
             admins: 2,
             stores:[
                      {store:"GENERAL",
                      sales:{
                            day:{number: 32},
                            months:[
                                      {month:"Noviembre 2014", amount:1000000},
                                      {month:"Diciembre 2014", amount:1100000},
                                      {month:"Enero 2015", amount:1280000},
                                      {month:"Febrero 2015", amount:920000},
                                      {month:"Marzo 2015", amount:1200000},
                                      {month:"Abril 2015", amount:600000}
                            ]},
                      },
                      {store:"La Tiendita",
                      last_month: 300000,
                      sales:{
                            months:[
                                      {month:"Noviembre 2014", amount:300000},
                                      {month:"Diciembre 2014", amount:440000},
                                      {month:"Enero 2015", amount:400000},
                                      {month:"Febrero 2015", amount:189000},
                                      {month:"Marzo 2015", amount:300000},
                                      {month:"Abril 2015", amount:100000}
                            ]},
                      },
                      {store:"El Ninos",
                      last_month: 350000,
                      sales:{
                            months:[
                                      {month:"Noviembre 2014", amount:400000},
                                      {month:"Diciembre 2014", amount:500000},
                                      {month:"Enero 2015", amount:440000},
                                      {month:"Febrero 2015", amount:200000},
                                      {month:"Marzo 2015", amount:350000},
                                      {month:"Abril 2015", amount:200000}
                            ]},
                      },
                      {store:"Los socios",
                      last_month: 200000,
                      sales:{
                            months:[
                                      {month:"Noviembre 2014", amount:440000},
                                      {month:"Diciembre 2014", amount:400000},
                                      {month:"Enero 2015", amount:400000},
                                      {month:"Febrero 2015", amount:520000},
                                      {month:"Marzo 2015", amount:500000},
                                      {month:"Abril 2015", amount:300000}
                            ]},
                      },
                    ],
             sellers:{cant: 10,
                      top:[
                          {_id:"54d7f99a4d6163026b080000" ,name:"Diekrul Jaume" ,amount: 1002},
                          {_id:"54d9231b4d616307f3000000" ,name:"Adolfo Diaz" ,amount: 1001},
                          {_id:"1234567890" ,name:"Mario wise" ,amount: 100},
                          {_id:"1234567890" ,name:"Pablito Log" ,amount: 101},
                          {_id:"1234567890" ,name:"Loko Hanks", amount:40},
                       ],
                     worst:[
                          {_id:"1234567890" ,name:"Loko Hanks", amount:40},
                          {_id:"1234567890" ,name:"Pablito Log" ,amount: 101},
                          {_id:"1234567890" ,name:"Mario wise" ,amount: 100},
                          {_id:"54d9231b4d616307f3000000" ,name:"Adolfo Diaz" ,amount: 1001},
                          {_id:"54d7f99a4d6163026b080000" ,name:"Diekrul Jaume" ,amount: 1002},
                       ],
                     hours:[
                          {},
                            ]
                     },
             decreases: [
                          {date: Date.today, amount:300000, user: current_user, comment:"Se nos cayó la caja de mistral."},
                          {date: Date.today, amount:200000, user: current_user, comment:"El adolfo se fue por dentro."},
                          {date: Date.today, amount:453000, user: current_user, comment:"Fecha de vencimiento."},
                          {date: Date.today, amount:530000, user: current_user, comment:"Fecha de vencimiento."},
                          {date: Date.today, amount:300000, user: current_user, comment:"Fecha de vencimiento."},
                          {date: Date.today, amount:430000, user: current_user, comment:"Fecha de vencimiento."},
                        ],
             products:{ 
                        cant: 1211,
                        top:[
                              {_id:"54d12da669736c0d28610400" ,name:"Mistral ice", number:30, price:1000 ,amount: 30000},
                              {_id:"54d12da669736c0d28530400" ,name:"Capel 1Lt", number:30, price:1000 ,amount: 300000},
                              {_id:"1" ,name:"Chimbombo durazno", number:30, price:1000 ,amount: 100000},
                              {_id:"2" ,name:"Coca-cola express", number:30, price:1000 ,amount: 90000},
                              {_id:"3" ,name:"Bom bom bum", number:30, price:1000 ,amount: 70000},
                            ],
                        top:[
                              {_id:"3" ,name:"Bom bom bum", number:30, price:1000 ,amount: 70000},
                              {_id:"2" ,name:"Coca-cola express", number:30, price:1000 ,amount: 90000},
                              {_id:"1" ,name:"Chimbombo durazno", number:30, price:1000 ,amount: 100000},
                              {_id:"54d12da669736c0d28530400" ,name:"Capel 1Lt", number:30, price:1000 ,amount: 300000},
                              {_id:"54d12da669736c0d28610400" ,name:"Mistral ice", number:30, price:1000 ,amount: 30000},
                            ]
             }

            }
  end

  # Registro del nuevo Client
  def register_create
  	params[:user][:role_id] = Role.find_by({ name: "Comerciante" }).id.to_s
  	user_params = params.require(:user).permit(:name, :lastname, :email, :password, :password_confirmation, :client_id, :role_id)
  	@client = Client.new({ name: params[:company][:name] })
  	
  	if @client.save
			@user = User.new(user_params)
	  	@user.client = @client
	  	
	  	if @user.save
	  		redirect_to root_url
	  		return
	  	else
	  		@client.destroy
	  	end
  	end
  	render :register  	
  end

end
