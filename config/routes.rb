Rails.application.routes.draw do

  namespace :public do
    get 'items/index'
  end
  namespace :admin do
    get 'customers/index'
    get 'customers/show'
    get 'customers/edit'
  end
  devise_for :customers,skip: [:passwords], controllers: {
    registrations: "public/registrations",
    sessions: 'public/sessions'
  }

  devise_for :admin, skip: [:registrations, :passwords] ,controllers: {
    sessions: "admin/sessions"
  }

  scope module: :public do
    root :to => "homes#top"
    get '/about' => "homes#about"
    patch '/customers/withdraw' => "public/customers#withdraw"
    get '/custmoers/mypage' => "customers#show"
    get '/custmoers/unsubscribe' => "customers#unsubscribe"
    resources :customers, only: [:edit, :update]
    resources :addresses, only: [:index, :create, :edit, :update, :destroy]
    resources :items, only: [:index, :show]
    post '/orders/confirm' => "orders#confirm"
    get '/orders/thanks' => "order#thanks"
    resources :orders, only: [:index, :show, :new, :create]
    resources :cart_items, only: [:index, :create, :update, :destroy]
    delete '/cart_items/destroy_all' => "cart_items#destroy_all"
  end

  namespace :admin do
    root :to => "homes#top"
    resources :admins
    resources :genres, only: [:index, :create, :edit, :update]
    resources :items, only: [:new, :index, :show, :edit, :update, :create]
    resources :cuntomers, only: [:index, :show, :edit, :update]
    resources :orders, only: [:show, :update] do
      resources :order_details, only: [:update]
    end
  end
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
