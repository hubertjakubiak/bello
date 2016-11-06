Rails.application.routes.draw do
  resources :boards, only: [:index, :new, :create, :edit, :update, :destroy]
  get '/login' => 'sessions#new'
  post '/login' => 'sessions#create'
  delete '/logout' => 'sessions#destroy'
  get '/signup', to: 'users#new'
  post '/users', to: 'users#create'
  root 'boards#index'
end
