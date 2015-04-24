Rails.application.routes.draw do
  devise_for :users, :path => 'accounts'

  root 'articles#news'
  get  'articles/news', 'articles/sports', 'articles/life', 'articles/money',
       'articles/tech', 'articles/travel', 'articles/opinion', 'articles/weather'
  resources :users
  resources :articles

end
