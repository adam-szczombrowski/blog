Rails.application.routes.draw do
  devise_for :users
  root 'home#welcome'
  resources :articles
  resources :projects
  resources :contacts, only: [:new, :create]

  get '*path' => redirect('/')
end
