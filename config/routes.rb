Tut1::Application.routes.draw do

  get "index/home"
  # The priority is based upon order of creation: first created -> highest priority.
  # See how all your routes lay out with "rake routes".

  # You can have the root of your site routed with "root"
  root 'index#home'

  devise_for :users, path: '',
    path_names: {
      sign_in: 'login',
      sign_out: 'logout',
      password: 'reset_password'
    }

  resources :users

  # API RESTful
  namespace :api, defaults: {format: :json} do
    namespace :v1 do
      
      post 'sales/:id', to: 'sales#create'
      get 'sales/:id', to: 'sales#show'
      get 'sales', to: 'sales#index'
      put 'sales/:id', to: 'sales#update'
    end
  end

end