Rails.application.routes.draw do
  resources :boards, only: [:index, :new, :create, :edit, :update, :destroy]
  root 'boards#index'
end
