Rails.application.routes.draw do
  resources :rooms
  resources :characters, shallow: true do
    resources :items
  end

  resources :visitors

  devise_for :users

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  root to: "home#index"

end
