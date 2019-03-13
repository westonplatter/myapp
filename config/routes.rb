Rails.application.routes.draw do
  devise_for :users

  get 'landing_page/index'

  get '/home', to: "home#index"

  namespace :admin do
    resources :users
  end

  resources :plans

  root 'landing_page#index'
end
