Rails.application.routes.draw do
  get 'policies', to: 'home#policies'
  get 'home_stats', to: 'home#home_page'
  resources :volunteers
  resources :oxygen_suppliers do
    member do
      post :update_fake
      post :update_unavailable
      post :update_last_verified_at
    end
  end
  resources :hospital_beds do
    member do
      post :update_fake
      post :update_unavailable
      post :update_last_verified_at
    end
  end
  resources :plasma_donors do
    member do
      post :update_fake
      post :update_unavailable
      post :update_last_verified_at
    end
  end

  resources :medicines do
    member do
      post :update_fake
      post :update_unavailable
      post :update_last_verified_at
    end
  end

  resources :external_links do
    collection do
      get :index_table
    end
  end


  resources :cities
  devise_for :users



  root to: "home#home_page"
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
