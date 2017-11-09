Rails.application.routes.draw do
  devise_for :admin_users, ActiveAdmin::Devise.config
  ActiveAdmin.routes(self)
  namespace :api do
    resources :articles
    get "/articles/by_tag/:tag_name" => "articles#get_by_tag", :as => :articles_by_tag
  end

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
