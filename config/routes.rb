Rails.application.routes.draw do
  devise_for :admin_users, ActiveAdmin::Devise.config
  root 'home#index'
  ActiveAdmin.routes(self)
  namespace :api do
    resources :articles, controller: 'longread_articles', only: [:index, :show] do
      collection do
        get 'show_fixed'
        get 'show_random'
        get 'translated'
      end 
    end
    resources :images do

    end
    resources :documents do
    end
    resources :blogs, only: [:index, :show] do
      collection do
        get 'translated'
      end
    end
    resources :news, controller: 'news_articles', only: [:index, :show] do
      collection do
        get 'translated'
      end
    end
    resources :media, controller: 'media_articles', only: [:index, :show] do
      collection do
        get 'translated'
      end
    end
    resources :tags, only: [:index, :show] do
      collection do
        get 'most_used', action: :most_used
      end
    end
    get 'all_articles', to: 'articles#all'
    get 'blogs_page_config', to: 'blogs_configs#index'
    get 'main_page_config', to: 'main_configs#index'
  end
  get '*path' => 'home#index'
end
