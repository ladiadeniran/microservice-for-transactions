Rails.application.routes.draw do
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html
  #
  namespace :v1 do
    resources :transactions
    resources :customers, only: :index
    resources :currencies, only: :index
  end

  # Defines the root path route ("/")
  root "v1/transactions#index"
end
