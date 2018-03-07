Rails.application.routes.draw do
  devise_for :admin_users, ActiveAdmin::Devise.config
  root 'home#index'
  ActiveAdmin.routes(self)
  namespace :api do
    resources :articles, controller: 'longread_articles', type: 'LongreadArticle', only: [:index, :show] do
      collection do
        get 'show_fixed'
      end 
    end
    resources :images do

    end
    resources :blogs, controller: 'blog_articles', type: 'BlogArticle', only: [:index, :show]
    resources :news, controller: 'news_articles', type: 'NewsArticle', only: [:index, :show]
    resources :tags, only: [:index, :show] do
      collection do
        get 'most_used', action: :most_used
      end
    end
    get 'site_config', to: 'site_configs#index'
  end
  get '*path' => 'home#index'
end
