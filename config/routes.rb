Rails.application.routes.draw do
  get 'home/home_page'
  resources :volunteers
  resources :oxygen_suppliers
  resources :hospital_beds
  resources :plasma_donors
  resources :cities
  devise_for :users



  root to: "home#home_page"
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
