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
    resources :health_assessments, only: [:new]
  end
  resources :tasks, only: [:create, :show, :update, :edit] do
    put :pickup
    put :done, :archive
  end
  resources :health_assessments, only: [:create, :show, :update, :edit, :destroy]

  ActiveAdmin.routes(self)
  devise_for :users
end
