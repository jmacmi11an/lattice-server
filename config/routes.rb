Rails.application.routes.draw do

  root :to => 'pages#home'
  resources :users
  resources :projects
  resources :cards
  resources :tasks

end
