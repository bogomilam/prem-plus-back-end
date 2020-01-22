Rails.application.routes.draw do
  resources :follows
  resources :matches
  get '/matches/:id/simulate', to: 'matches#simulate'
  resources :competitions
  resources :fixtures
  resources :players
  resources :club_stats
  resources :clubs
  
  namespace :api do
    namespace :v1 do
        get '/users/validate_user', to: 'users#validate_user'
        resources :users, only: [:create, :index, :show, :update, :delete]
        post '/users/login', to: 'users#login'
        post '/users/signup', to: 'users#signup'
        # resources :follows, only: [:create, :show, :index]
    end
  end
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
