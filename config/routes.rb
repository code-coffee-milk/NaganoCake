Rails.application.routes.draw do
  root to: 'customers/homes#home'
  get 'home/about' => 'customers/homes#about'
  get 'customers/unsubscribe' => 'customers/customers#unsubscribe'
  patch 'customers/withdraw' => 'customers/customers#withdraw'
  delete 'cart_items/destroy_all' => 'customers/cart_items#destroy_all'
  post 'orders/comfilm' => 'customers/orders#comfilm'
  get 'orders/complete' => 'customers/orders#complete'
  get 'admin/homes/top' => 'admin/homes#top'
  patch 'admin/order_details/:id' => 'admin/order_products#update'

  devise_for :customers
  namespace :customers do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  resources :customers ,:only => [:show, :edit,:update]
  resources :products ,:only => [:show,:index]
  resources :cart_items ,:only => [:index, :update, :create,:destroy]
  resources :orders ,:only => [:index,:show,:new,:create]
  resources :shippings, :only => [:index,:edit,:create,:update,:destroy]
  end

  devise_for :admins
  namespace :admin do
  resources :products, :only => [:index,:show,:new,:create,:edit,:update]
  resources :genres, :only => [:index,:create,:edit,:show,:update]
  resources :customers, :only => [:index,:show,:edit,:update]
  resources :orders, :only => [:index,:show,:update]
  end
end
