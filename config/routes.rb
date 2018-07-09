Rails.application.routes.draw do
  mount RailsAdmin::Engine => '/admin', as: 'rails_admin'
  # User creation & management routes
  devise_for :users

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  root to: 'application#index'

  get 'application/index'
  get 'user/profile', to: 'authenticated#profile'
  get 'about', to: 'application#about'
  get 'features', to: 'application#features'
  scope 'user', module: 'authenticated' do
    resources :characters, only: [:index, :show, :new, :create] # TODO: add all options
  end

  scope module: 'application' do
    resources :character_classes, path: 'classes', only: [:index, :show]
  end
end
