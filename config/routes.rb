Rails.application.routes.draw do
  get 'twitter_block/show'
  get 'twitter_block/new'
  get 'twitter_block/create'
  get 'twitter_block/edit'
  get 'twitter_block/update'
  get 'twitter_block/destroy'
  resources :dashboards, only: [:show, :new, :create]
  devise_for :users
  root to: 'pages#home'
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
