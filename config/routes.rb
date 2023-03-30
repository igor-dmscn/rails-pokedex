Rails.application.routes.draw do
  root "pokemons#index"

  resources :pokemons, except: [:update, :edit, :delete]
end
