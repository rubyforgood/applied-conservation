Rails.application.routes.draw do
  root 'projects#index'

  resources :projects do
    resources :targets, only: [:new, :index]
    resources :tasks, only: [:new, :index]
  end
  resources :targets, only: [:create, :show, :update, :edit]
  resources :tasks, only: [:create, :show, :update, :edit] do
    put :pickup
    put :done, :archive
  end
  resources :target_health_attribute_ratings, only: [:update]

  devise_for :users
end
