Rails.application.routes.draw do
  root 'projects#index'

  resources :projects do
    resources :targets, only: [:new, :index] do
      collection do
        get :edit_all
        put :update_all
      end
    end
    resources :tasks, only: [:new, :index]
  end
  resources :targets, only: [:create, :show, :update, :edit] do
    resources :health_attributes, only: [:new]
  end
  resources :tasks, only: [:create, :show, :update, :edit] do
    put :pickup
    put :done, :archive
  end
  resources :health_attributes

  get  '/default_health_ratings/import', to: 'default_health_ratings#import',     as: 'import_default_health_ratings'
  post '/default_health_ratings/import', to: 'default_health_ratings#import_csv', as: ''

  ActiveAdmin.routes(self)
  devise_for :users
end
