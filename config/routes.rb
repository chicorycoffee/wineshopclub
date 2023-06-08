Rails.application.routes.draw do
  devise_for :users
  root to: 'posts#index'
  resources :posts do
    resources :comments, only: :create
  end

  resources :users, only: :show do
   resources :profiles, only: [:new, :create, :edit, :update]
   resource :profiles, only: :show
  end
end
