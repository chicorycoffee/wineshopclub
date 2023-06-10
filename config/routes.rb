Rails.application.routes.draw do
  devise_for :users
  root to: 'posts#index'
  resources :posts do
    resources :comments, only: :create
    resource :likes, only: [:create, :destroy]
  end

  resources :users do
   resources :profiles, only: [:new, :create, :edit, :update]
   resource :profiles, only: :show
   resource :relationships, only: [:create, :destroy]
  end
end
