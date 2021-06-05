Rails.application.routes.draw do
  resources :halls, :movies, :tickets, :seances

  resources :reservations, only: %i[index show update destroy] do
    collection do
      post '/online', to: 'reservations#create_online'
      post '/offline', to: 'reservations#create_offline'
    end
  end
end
