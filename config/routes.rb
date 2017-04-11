Rails.application.routes.draw do
  root 'home#index'
  devise_for :users
  resources :locations, param: :slug do 
    resources :sounds, param: :slug 
  end
  mount ActionCable.server => '/cable'
end
