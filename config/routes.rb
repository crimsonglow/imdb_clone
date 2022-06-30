Rails.application.routes.draw do
  devise_for :users

  devise_scope :user do
    get '/users/sign_out' => 'devise/sessions#destroy'
  end

  resources :movies
  resources :rating, only: [:create, :update]

  root "movies#index"
end
