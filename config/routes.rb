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
    resources :users, only: [:index, :show, :edit, :update, :destroy] do
      get 'change_deleted', to: 'users#change_deleted'
    end
  end

  scope module: :users do
    root to: "homes#top"
    devise_scope :user do
    post "/sessions/guest"=>"sessions#guest"
    end
    get "/users/confirm"=>"users#confirm"
    patch "/users/withdrawal"=>"users#withdrawal"
    resources :posts, only: [:new, :create, :index, :show, :edit, :update, :destroy] do
      resource :favorites, only: [:create, :destroy]
      resources :post_comments, only: [:create, :destroy]
      collection do
        get 'search'
      end
    end
    resources :post_comments, only: [:create, :destroy]
    resources :users, only: [:show, :edit, :update]
  end
end
