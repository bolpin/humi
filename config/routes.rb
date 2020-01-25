# For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
Rails.application.routes.draw do
  devise_for :users, ActiveAdmin::Devise.config

  ActiveAdmin.routes(self)

  resources :disbursements
  resources :donations

  get '/report', to: 'report#index', format: false

  root to: "home#index"
end
