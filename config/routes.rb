Rails.application.routes.draw do
 resources :books
 root 'books#new'
  end