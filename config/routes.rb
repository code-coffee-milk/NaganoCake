Rails.application.routes.draw do
  root to: 'customers/homes#home'
  get 'home/about' => 'customers/homes#about'

  devise_for :customers
  namespace :customers do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  resources :customers ,:only => [:show, :edit,:update]
  get 'customers/unsubscribe' => 'customers#unsubscribe'
  patch 'customers/withdraw' => 'customers#withdraw'
  resources :products ,:only => [:show,:index]
  resources :cart_items ,:only => [:index, :update, :create,:destroy]
  delete 'cart_items/destroy_all' => 'cart_items#destroy_all'
  resources :orders ,:only => [:index,:show,:new,:create]
  post 'orders/comfilm' => 'orders#comfilm'
  get 'orders/complete' => 'orders#complete'
  resources :shippings, :only => [:index,:edit,:create,:update,:destroy]
  end
  
  devise_for :admins
  namespace :admin do
  get 'admin/homes/top' => 'homes#top'
  resources :products, :only => [:index,:show,:new,:create,:edit,:update]
  resources :genres, :only => [:index,:create,:edit,:show,:update]
  resources :customers, :only => [:index,:show,:edit,:update]
  resources :orders, :only => [:index,:show,:update]
  patch 'admin/order_details/:id' => 'order_productss#update'
  end
end
