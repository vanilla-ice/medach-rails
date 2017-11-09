Rails.application.routes.draw do
  devise_for :admin_users, ActiveAdmin::Devise.config
  ActiveAdmin.routes(self)
  namespace :api do
    resources :articles do
      collection do
        get 'all_tags'
      end
      member do
        get 'by_tag/:tag_name', action: :by_tag, as: :by_tag
      end
    end
  end
end
