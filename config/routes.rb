Rails.application.routes.draw do
  # don't use Devise namespace for omniauth callbacks (will inherit from existing class instead):
  devise_for :users, controllers: { omniauth_callbacks: "omniauth_callbacks" } 

  resources :products, only: [:index, :show]

  resources :order_items, except: [:create]
  post 'order_items/add/(:product_id)', to: 'order_items#create', as: "add_order_item"
  patch 'order_items/update', to: 'order_items#update', as: "update_order_item"

  resources :orders

  root to: "products#index"

end
