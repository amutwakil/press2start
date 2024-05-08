Rails.application.routes.draw do

  #home
  root "home#index"

  # static pages
  get 'contact', to: "static_pages#contact"
  get 'about', to: "static_pages#about"

  # games
  get 'reviews', to: 'games#index'
  get 'games', to: 'games#index'
  post 'games', to: 'games#create'
  resources :games, path: 'game', except: [:index, :create]

  #errors
  match "/404", to: "errors#not_found", via: :all
  match "/500", to: "errors#internal_server_error", via: :all

end
