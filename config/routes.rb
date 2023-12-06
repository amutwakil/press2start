Rails.application.routes.draw do
  # static pages
  root "static_pages#home"
  get 'home', to: "static_pages#home"
  get 'contact', to: "static_pages#contact"
  get 'about', to: "static_pages#about"

  # games
  get 'reviews', to: 'games#index'
  get 'games', to: 'games#index'
  post 'games', to: 'games#create'
  resources :games, path: 'game', except: [:index, :create]

end
