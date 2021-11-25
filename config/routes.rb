Rails.application.routes.draw do
  resources :dashboards, only: [:show, :new, :create] do
    resources :twitter_blocks, only: [:show, :new, :create, :update, :destroy]
    resources :news_blocks, only: [:show, :new, :create, :update, :destroy]
    resources :key_figures_blocks, only: [:show, :new, :create, :update, :destroy]
  end

  resources :positions, only: [:edit, :update, :destroy]

  devise_for :users
  root to: 'pages#home'
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
