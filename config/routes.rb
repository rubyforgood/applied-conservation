Rails.application.routes.draw do
  root 'projects#index'

  devise_for :users
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

  resources :projects do
    resources :targets
  end

  devise_for :users
end
