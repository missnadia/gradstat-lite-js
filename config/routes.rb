Rails.application.routes.draw do
  root 'static#home'
  get '/signup' => 'students#new'
  get '/login' => 'sessions#new'
  post '/login' => 'sessions#create'
  delete '/logout' => 'sessions#destroy'
  match 'auth/:provider/callback', to: 'sessions#create', via: [:get, :post]
  match 'auth/failure', to: redirect('/'), via: [:get, :post]

  resources :courses do
    resources :comments
  end
  
  resources :students
  resources :charts, only: [:index]
  resources :sessions, only: [:create, :destroy]
  resource :static, only: [:home]
end
