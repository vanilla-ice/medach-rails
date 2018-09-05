Rails.application.routes.draw do
  devise_for :users, ActiveAdmin::Devise.config
  root 'home#index'
  ActiveAdmin.routes(self)
  namespace :api do
    resources :articles, only: [:index, :show] do
      collection do
        get 'show_fixed'
        get 'show_random'
        get 'translated'
        get 'all'
      end 
    end
    resources :images
    resources :documents
    resources :longread_articles, only: :index do
      collection do
        get 'translated'
      end
    end
    resources :blogs, only: :index do
      collection do
        get 'translated'
      end
    end
    resources :news, only: :index do
      collection do
        get 'translated'
      end
    end
    resources :media, only: :index do
      collection do
        get 'translated'
      end
    end
    resources :tags, only: [:index, :show] do
      collection do
        get 'most_used', action: :most_used
      end
    end
    resources :users, only: [:show]
    get 'all_articles', to: 'articles#all'
    get 'blogs_page_config', to: 'blogs_configs#index'
    get 'main_page_config', to: 'main_configs#index'
  end
  get '*path' => 'home#index'
end
