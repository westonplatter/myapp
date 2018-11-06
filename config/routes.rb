Rails.application.routes.draw do
  devise_for :users
  get 'landing_page/index'
  root 'landing_page#index'
end
