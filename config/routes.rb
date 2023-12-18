Rails.application.routes.draw do

root "municipes#index"
resources :municipes
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  # root "articles#index"
end
