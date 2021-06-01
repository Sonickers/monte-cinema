Rails.application.routes.draw do
  resources :halls, :movies, :tickets, :seances
end
