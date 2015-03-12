Rails.application.routes.draw do
  # don't use Devise namespace for omniauth callbacks (will inherit from existing class instead):
  devise_for :users, controllers: { omniauth_callbacks: "omniauth_callbacks" } 

  resources :products

  root to: "products#index"

end
