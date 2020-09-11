Rails.application.routes.draw do
  resources :characters do
  resources :char_attributes
 end
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
