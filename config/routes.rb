Rails.application.routes.draw do
  root 'home#index'
  devise_for :users
  resources :locations, param: :slug
  resources :sounds
  mount ActionCable.server => '/cable'
end
