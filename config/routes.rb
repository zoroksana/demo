Rails.application.routes.draw do

  get 'admin' => 'admin#index'

  controller :sessions do
    get 'login' => :new
    post 'login' => :create
    delete 'logout' => :destroy
  end


  resources :users
  resources :orders
  resources :line_items
  resources :carts
  get 'store/index'

  resources :products
  root to: 'store#index', as: 'store'

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
