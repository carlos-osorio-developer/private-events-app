Rails.application.routes.draw do
  devise_for :users
  resources :users, only: [:index, :show]
  resources :events, only: [:index, :new, :create, :show]

  resources :attendings do
    member do
      post :attend
    end
  end

  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  root to: "events#index"
end
