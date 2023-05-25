Rails.application.routes.draw do
  resources :games 
  resources :decks
  resources :commanders
  resources :formats
  resources :magic_sets
  resources :players
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  # root "articles#index"

  post 'games/raw', to: 'games#create_from_raw'
end
