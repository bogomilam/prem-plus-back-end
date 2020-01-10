Rails.application.routes.draw do
  resources :matches
  resources :competitions
  resources :fixtures
  resources :players
  resources :club_stats
  resources :clubs
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
