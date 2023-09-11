Rails.application.routes.draw do
  devise_for :users, skip: [:passwords], controllers: {
    registrations: "users/registrations",
    sessions: 'users/sessions'
  }

  devise_for :admins, skip: [:registrations, :passwords], controllers: {
    sessions: "admins/sessions"
  }

  namespace :admins do
    resources :posts, only: [:index, :show, :destroy]
    resources :post_comments, only: [:destroy]
    resources :users, only: [:edit, :update, :destroy]
  end
  
  scope module: :users do
    root to: "homes#top"
    resources :posts, only: [:new, :create, :index, :show, :edit, :update, :destroy]
    resources :post_comments, only: [:create, :destroy]
    resources :users, only: [:show, :edit, :update]
    patch "/users/withdrawal"=>"users#withdrawal"
    post "/sessions/guest"=>"sessions#guest"
  end
end
