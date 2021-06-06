Rails.application.routes.draw do
  resources :halls, :movies, :seances

  resources :reservations, only: %i[index show update destroy] do
    resources :tickets, controller: 'reservations/tickets'

    collection do
      post '/online', to: 'reservations#create_online'
      post '/offline', to: 'reservations#create_offline'
    end
  end
end
