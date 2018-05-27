Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  resources :users do
    resources :assistances
  end

  post '/users/registerhash', to: 'users#register_hash'

  get '/', to: 'users#index'

  get '/login/', to: 'auth#index', as: 'login'

  get '/logout', to: 'auth#logout'

  post '/login/', to: 'auth#login'

  post '/maintenance/toggle', to: 'users#toggle_maintenance'

  post '/users/registerassistance', to: 'users#register_assistance'

  get '/assistances', to: 'assistances#index'

  post '/shutdown', to: 'users#shutdown'

end
