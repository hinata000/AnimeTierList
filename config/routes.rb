Rails.application.routes.draw do
  devise_for :users

  devise_scope :user do
    post 'users/guest_sign_in', to: 'users/sessions#guest_sign_in'
  end

  root 'homes#index'

  resources :users, only: [:show, :edit, :update]

  resources :notifications, only: :index

  get '/mypage' => 'users#mypage'

  resources :animations, only: [:index, :show,] do
    resources :tier_lists, only: [:create, :new, :edit, :update, :destroy]
    resources :tier_list_entiers, only: [:create, :new, :edit, :update, :destroy]
    collection do
      get 'search_results'
      get 'bookmarks'
    end
  end

  resources :relationships, only: [:create, :destroy]

  resources :bookmarks, only: [:create, :destroy]

  resources :users do
    get 'followings' => 'relationships#followings', as: 'followings'
    get 'followers' => 'relationships#followers', as: 'followers'
  end
end
