Rails.application.routes.draw do
  # User creation & management routes
  devise_for :users

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  root to: 'application#index'

  get 'application/index'
  get 'authenticated/protected_index'
  get 'about', to: "application#about"
  get 'features', to: 'application#features'
end
