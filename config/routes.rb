Rails.application.routes.draw do

  root to: 'public/homes#top'
  devise_for :admins, controllers: {
    sessions:      'admins/sessions',
    passwords:     'admins/passwords',
    registrations: 'admins/registrations'
  }
  devise_for :end_users, controllers: {
    sessions:      'end_users/sessions',
    passwords:     'end_users/passwords',
    registrations: 'end_users/registrations'
  }

  namespace :admin do
    get '/' => 'homes#top'
    resources :end_users, only: [:index, :show]

    resources :items
    resources :genres, only: [:index, :create, :edit, :update]
    resources :orders, only: [:index, :show, :update]
    resources :order_details, only: [:update]
  end

  scope module: 'public' do
    get '/about' => 'homes#about'
    get 'customers/show'
    get 'customers/edit'
    patch 'customers/update'
    get 'customers/confirm'
    patch 'customers/withdraw'

    resources :items, only: [:index, :show]
    resources :cart_items, only: [:index, :create, :update, :destroy]
    delete 'cart_items' => 'cart_items#destroy_all', as:'destroy_all'

    get 'orders/done' => 'orders#done'
    get 'orders/confirm'
    resources :orders, only: [:index, :new, :create, :show]

    resources :addresses
  end
end
