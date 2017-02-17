Rails.application.routes.draw do
  resources :type_formats
  resources :type_articles
  resources :type_vehicles
  root 'main#index'

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
