Rails.application.routes.draw do
  root 'home#index'
  devise_for :users
  resources :locations, params: :slug do 
    resources :sounds
  end
  mount ActionCable.server => '/cable'
end
