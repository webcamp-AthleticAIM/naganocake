Rails.application.routes.draw do

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
    resources :customers, only: [:edit, :update]
    get '/custmoers/mypage' => "public/customers#show"
    get '/custmoers/unsubscribe' => "public/customers#unsubscribe"
    patch '/customers/withdraw' => "public/customers#withdraw"
    resources :addresses, only: [:index, :edit, :create, :update, :destroy]
    resources :items, only: [:index, :show]
    resources :orders, only: [:index, :show, :new, :create]
    post '/orders/confirm' => "public/orders#confirm"
    get '/orders/thanks' => "public/order#thanks"
    resources :cart_items, only: [:index, :create, :update, :destroy]
    delete '/cart_items/destroy_all' => "public/cart_items#destroy_all"
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
