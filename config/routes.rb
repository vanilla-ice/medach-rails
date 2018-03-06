Rails.application.routes.draw do
  devise_for :admin_users, ActiveAdmin::Devise.config
  root 'home#index'
  ActiveAdmin.routes(self)
  namespace :api do
    resources :articles, controller: 'longread_articles', type: 'LongreadArticle', only: [:index, :show] do
      collection do
        get 'all_tags'
        get 'by_tag/:tag_name', action: :by_tag
        get 'search'
        get 'tags_count'
        get 'show_fixed'
      end 
    end
    resources :images do

    end
    resources :blogs, controller: 'blog_articles', type: 'BlogArticle', only: [:index, :show]
    resources :news, controller: 'news_articles', type: 'NewsArticle', only: [:index, :show]
  end
  get '*path' => 'home#index'
end
