Rails.application.routes.draw do
  resources :purchase_details
  resources :states
  resources :purchases do
    get :autocomplete_supplier_bname, :on => :collection
  end
  resources :type_documents
  resources :suppliers
  resources :brands
  resources :articles do
    get :search_article
  end
  resources :payment_methods
  resources :type_formats
  resources :type_articles
  resources :type_vehicles
  root 'main#index'

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
