Rails.application.routes.draw do
  devise_for :users
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  root "main#index"
  resources :physicians
  resources :patients
  resources :appointments
  resources :diagnosis_items
end
