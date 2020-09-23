Rails.application.routes.draw do
  root to: 'home#index'
  resources :characters do
    resources :char_attributes
  end
  devise_for :users
  devise_scope :user do
    get '/users/sign_out' => 'devise/sessions#destroy'
  end
  resources :users, only: [:show]
  match 'users/:id' => 'users#destroy', :via => :delete, :as => :admin_destroy_user
end
