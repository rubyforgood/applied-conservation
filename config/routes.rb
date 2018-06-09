Rails.application.routes.draw do
  root 'projects#index'

  resources :projects do
    resources :targets
    resources :tasks 
  end

  devise_for :users
end
