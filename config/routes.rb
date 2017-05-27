Rails.application.routes.draw do
  resources :users, only: [:new, :create] do
    resources :dashboard, only: [:index]
    resources :workouts do  
      resources :cardio_exercises, except: [:index]
      resources :strength_exercises do
        resources :lift_sets
      end
    end
  end

  resources :muscle_group, only: [:index, :show]
  resources :cardio_activity, only: [:index]
  namespace :admin do 
    resources :users
  end
  
  get '/login', to: "sessions#new"
  post '/login', to: "sessions#create"
  delete '/login', to: "sessions#destroy"

  root to: "root_director#index"

end

