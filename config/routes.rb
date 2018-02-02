Rails.application.routes.draw do
  # User creation & management routes
  devise_for :users

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  root to: 'application#index'

  get 'application/index'
  get 'user/profile', to: "authenticated#profile"
  get 'about', to: "application#about"
  get 'features', to: 'application#features'
  scope 'user', module: 'authenticated' do
    resources :characters
  end

  scope module: 'application' do
    resources :character_classes, path: 'classes'
  end
end
