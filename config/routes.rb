Rails.application.routes.draw do
  root "lists#index"
  resources :articles
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  resources :movies
  resources :lists do
    resources :bookmarks, only: [ :new, :create ]
  end
  resources :bookmarks, only: [ :destroy ]
  resources :articles, except: :index
end
