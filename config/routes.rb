Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  resources :users
  resources :assistances

  get '/login/', to: 'auth#index', as: 'login'

  get '/logout', to: 'auth#logout'

  post '/login/', to: 'auth#login'

end
