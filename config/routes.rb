Rails.application.routes.draw do
  resources :lists do

    resources :tasks do
      member do
        post :completed
      end
    end
  end
end
