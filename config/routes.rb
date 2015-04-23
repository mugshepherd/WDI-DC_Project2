Rails.application.routes.draw do
  devise_for :users, :path => 'accounts'

  root 'articles#index'
  resources :users
  resources :articles

end
