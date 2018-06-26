Rails.application.routes.draw do
  root 'projects#index'

  resources :projects do
    resources :targets
    resources :tasks do
      put :pickup
      put :done, :archive
    end
  end

  resources :target_health_attribute_ratings, only: [:update]

  devise_for :users
end
