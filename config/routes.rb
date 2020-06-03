Rails.application.routes.draw do
  get '/signin'          , to: 'sessions#new'
  post'/signin'          , to: 'sessions#create'
  post '/logout'      , to: 'sessions#destroy'
  
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  resources :users, only: [:index, :new, :create, :update, :show]
  resources :events, only: [:index, :new, :create, :show]
  resources :invitations, only: [:index, :new, :create, :show]
  # resources :sessions, only: [:new, :create, :destroy]
end
