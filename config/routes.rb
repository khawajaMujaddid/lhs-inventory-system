Rails.application.routes.draw do
  devise_for :users

  devise_scope :user do
    root to: "devise/sessions#new"
  end

  resources :user, only: %i[index]
  resources :purchase
  resources :product
end
