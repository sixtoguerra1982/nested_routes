Rails.application.routes.draw do
  resources :buildings do
    resources :apartments
  end
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
