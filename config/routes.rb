Rails.application.routes.draw do

  namespace :api do
    resources :favorites
    resources :reviews
    resources :restaurants, only: [:index, :show]
    resources :users
    post '/users/login', to: 'users#login'
  end
  
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
