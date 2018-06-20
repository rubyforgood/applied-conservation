Rails.application.routes.draw do
  root 'projects#index'

  resources :projects do
    resources :targets
    resources :tasks do
      put :pickup
      put :done, :archive
    end
  end

  get  '/health_rating_standards/import', to: 'health_rating_standards#import',     as: 'import_health_rating_standards'
  post '/health_rating_standards/import', to: 'health_rating_standards#import_csv', as: ''

  devise_for :users
end
