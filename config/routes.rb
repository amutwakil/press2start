Rails.application.routes.draw do
  # static pages
  root "static_pages#home"
  get 'home', to: "static_pages#home"
  get 'contact', to: "static_pages#contact"
  get 'about', to: "static_pages#about"

  # games
  get 'reviews', to: 'games#index'
  resources :games, path: 'game'

end
