Rails.application.routes.draw do
  resources :publishers
  resources :books
  resources :shops
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

  root 'books#index'

  namespace 'api' do
    resources :books
    resources :publishers
    resources :shops

    get '/shops/info/:id', to: 'shops#info'
    get '/publishers/info/:id', to: 'publishers#info'
    post '/shops/:id/sell', to: 'shops#sell'
  end
  
end
