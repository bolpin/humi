# For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
Rails.application.routes.draw do
  devise_for :users, ActiveAdmin::Devise.config

  ActiveAdmin.routes(self)

  resources :disbursements
  resources :donations

  get '/reports', to: 'reports#index'
  get '/reports/new', to: 'reports#new'
  get '/reports/grant', to: 'reports#grant'

  root to: "home#index"
end
