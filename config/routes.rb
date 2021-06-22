Rails.application.routes.draw do
  namespace :admin do
      resources :users
      resources :ticket_types
      resources :reservation_statuses
      resources :seances
      resources :movies
      resources :ticket_desks
      resources :halls
      resources :movie_genres
      resources :tickets
      resources :reservations

      root to: "users#index"
    end
  devise_for :users, defaults: { format: :json }
  resources :halls, :movies, :seances

  resources :reservations, only: %i[index show update destroy] do
    resources :tickets, controller: 'reservations/tickets'

    collection do
      post '/online', to: 'reservations#create_online'
      post '/offline', to: 'reservations#create_offline'
    end
  end
end
