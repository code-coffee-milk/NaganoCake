Rails.application.routes.draw do
  devise_for :admins
  devise_for :customers
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  resources :customers ,:only => [:show, :edit,:update]
  get '/customers/unsubscribe' => 'customers#unsubscribe'
  patch '/customers/withdraw' => 'customers#withdraw'
  root to 'homes#home'
  get '/about' => 'homes#about'
  resources :products ,:only => [:show,:index]
  resources :cart_items ,:only => [:index, :update, :create,:destroy]
  delete '/cart_items/destroy_all' => 'cart_items#destroy'
  resources :orders ,:only => [:index,:show,:new,:create]
  post '/orders/comfilm' => 'orders#comfilm'
  get '/orders/complete' => 'orders#complete'
  resources :shippings, :only => [:index,:edit,:create,:update,:destroy]
  get '/admin/homes/top', 'homes#top'
  resources :products, only
  
end
