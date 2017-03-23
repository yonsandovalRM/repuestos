Rails.application.routes.draw do

  root 'web#index'
  get  'web/tienda'
  get  'web/contacto'
  get  'web/carro'

  resources :quotation_details
  resources :quotations do
    get :convert_to_quotation
  end
  resources :communes
  resources :sale_details
  resources :sales do
    get :convert_to_sale
  end
  resources :customers do
    get :search_customer
    collection do 
      post 'find_customer'
    end 
  end
  
  devise_for :users
  resources :status_payments
  resources :purchase_details
  resources :states
  resources :purchases
  resources :type_documents
  resources :suppliers do
     get :search_supplier
  end
  resources :brands
  resources :articles do
    get :search_article
    
  end
  # get 'tags/:tag', to: 'articles#index', as: :tag
  resources :tags, only: [:index, :show]
  resources :payment_methods
  resources :type_formats
  resources :type_articles
  resources :type_vehicles
  get 'main/index'


  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
