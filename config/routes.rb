Rails.application.routes.draw do
  resources :dashboards, only: [:show, :new, :create] do
    member do
      patch :move
    end
    resources :twitter_blocks, shallow: true, except: :index
    resources :news_blocks, shallow: true, except: :index
    resources :messari_blocks, shallow: true, except: :index
    resources :key_figures_blocks, shallow: true, except: :index
    get "choose_blocks", to: "blocks#choose_block"
  end

  resources :positions, only: [:edit, :update, :destroy]

  devise_for :users
  root to: 'pages#home'
  get "pages", to: "pages#notifications"
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
