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
    resources :media, controller: 'media_articles', only: [:index, :show]
    get 'blogs_page_config', to: 'blogs_configs#index'
    get 'main_page_config', to: 'main_configs#index'
    get 'all_articles', to: 'articles#all'
    get 'translated_articles', to: 'articles#translated'
  end
  get '*path' => 'home#index'
end
