Rails.application.routes.draw do
  # don't use Devise namespace for omniauth callbacks (will inherit from existing class instead):
  devise_for :users, controllers: { omniauth_callbacks: "omniauth_callbacks" } 

  resources :products, only: [:index, :show]

  resources :order_items
  get 'order_items/add/(:product_id)', to: 'order_items#create', as: "add_order_item"

  resources :orders

  root to: "products#index"

end
