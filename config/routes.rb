Rails.application.routes.draw do
  devise_for :users

  get 'landing_page/index'

  get '/home', to: "home#index"

  namespace :admin do
    resources :users
  end

  root 'landing_page#index'
end
