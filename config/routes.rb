Rails.application.routes.draw do
  resources :lists do
    resources :tasks
  end
  resources :task do
    resources :subtask
  end
end
