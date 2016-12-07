Rails.application.routes.draw do
  resources :boards, only: [:index, :new, :create, :edit, :update, :destroy] do
    resources :lists, only: [:new, :create, :edit, :update, :destroy]
  end
  resources :invitations

  get '/login' => 'sessions#new'
  post '/login' => 'sessions#create'
  delete '/logout' => 'sessions#destroy'
  get '/signup/:invitation_token', to: 'users#new', as: :signup_with_token
  get '/boards/:invitation_token', to: 'boards#index', as: :accept_invitation
  get '/signup', to: 'users#new'
  post '/users', to: 'users#create'
  root 'boards#index'

  #resource :car, controller: :session, only: [:update]

  namespace :api, defaults: {format: :json} do
    namespace :v1 do
      resources :boards, only: [:index, :show]
    end
  end

end
