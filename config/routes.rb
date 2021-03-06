Rails.application.routes.draw do

  root 'static_pages#home'

  get '/login', to: 'sessions#new'

  post '/login', to: 'sessions#create'

  get '/logout', to: 'sessions#destroy'

  resources :users, only: [:new, :create, :show, :index]
  resources :events, only: [:new, :create, :index, :show]
  resources :events_atendees, only: [:create, :destroy]

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
