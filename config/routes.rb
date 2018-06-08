Rails.application.routes.draw do
  root 'projects#index'
  resources :projects do
    resources :targets
  end

  devise_for :users
end
