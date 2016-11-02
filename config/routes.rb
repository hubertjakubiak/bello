Rails.application.routes.draw do

  resources :boards do 
    resources :lists
  end
  
   resources :lists do
      resources :cards
    end
  
  root 'boards#index'
end
