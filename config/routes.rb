Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  root 'destinations#index'
  resources :destinations

  namespace :api do 
    namespace :v1 do
      resources :destinations, only: [:index]
      get '/destination_weather', to: 'destination_weather#search'
    end 
  end

  resources :poems, only: [:index]
end
