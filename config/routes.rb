Rails.application.routes.draw do
  devise_for :users
  root to: 'posts#index'
  resources :posts do
    resources :comments, only: [:create, :destroy]
    resource :likes, only: [:create, :destroy]
  end

  get 'posts/index/hot' => 'posts#hot'
  get 'posts/index/next' => 'posts#next'
  get 'posts/index/wanted' => 'posts#wanted'

  resources :users do
   resources :profiles, only: [:new, :create, :edit, :update]
   resource :profiles, only: :show
   resource :relationships, only: [:create, :destroy]
  end
end
