Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  resources :users, only: [:update, :show, :index, :delete, :create] do
    resources :artworks, only: :show
  end
   
  

  resources :artworks, only: [:update, :show, :index, :delete, :create]
  resources :artwork_shares, only: [:update, :show, :index, :delete, :create]
end
