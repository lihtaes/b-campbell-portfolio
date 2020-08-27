Rails.application.routes.draw do
  devise_for :users, path: '', path_names: { sign_in: 'login', sign_out: 'logout', sign_up: 'register' }
  resources :portfolios, except: [:show] { put :sort, on: :collection }
  resources :topics, only: [:index, :show]
  resources :resume_items
  resources :blogs, path: 'blog'

  get 'angular-items', to: 'portfolios#angular'
  get 'portfolio/:id', to: 'portfolios#show', as: 'portfolio_show'

  get 'resume_item/:id', to: 'resume_items#show', as: 'resume_item_show'

  get 'resume', to: 'pages#resume'
  get 'contact', to: 'pages#contact'
  get 'tech-news', to: 'pages#tech_news'
  get 'about-me', to: 'pages#about'


  resources :blogs do
    member do
      get :toggle_status
    end
  end
  
  mount ActionCable.server => '/cable'

  root to: 'pages#home'
end