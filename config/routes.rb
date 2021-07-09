Rails.application.routes.draw do
  mount RailsAdmin::Engine => '/admin', as: 'rails_admin'
  devise_for :users

  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  root to: 'application#index'

  get '/', to: 'application#index'
  get 'about', to: 'application#about'
  get 'features', to: 'application#features'

  get 'user/profile', to: 'authenticated#profile'

  scope 'user', module: 'authenticated' do
    resources :characters
  end

  scope module: 'application' do
    resources :character_classes, path: 'classes'
  end
end
