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
    patch '/customers/withdraw' => "customers#withdraw"
    resources :customers, only: [:edit, :update]
    get '/customers/mypage' => "customers#show"
    get '/customers/unsubscribe' => "customers#unsubscribe"
    resources :addresses, only: [:index, :edit, :create, :update, :destroy]
    resources :items, only: [:index, :show]
    resources :orders, only: [:index, :show, :new, :create]
    get '/orders/thanks' => "order#thanks"
    post '/orders/confirm' => "orders#confirm"
    delete '/cart_items/destroy_all' => "cart_items#destroy_all"
    resources :cart_items, only: [:index, :create, :update, :destroy]

  end

  namespace :admin do
    root :to => "homes#top"
    resources :admins
    resources :genres, only: [:index, :create, :edit, :update]
    resources :items, only: [:new, :index, :show, :edit, :update, :create]
    resources :customers, only: [:index, :show, :edit, :update]
    resources :orders, only: [:show, :update] do
      resources :order_details, only: [:update]
    end
  end
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
