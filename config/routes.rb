Rails.application.routes.draw do
  resources :users, only: [:new, :create] do
    resources :dashboard, only: [:index]
    resources :workouts, only:[:index, :new, :create, :show] do
      resources :cardio_exercises
      resources :strength_exercises do
        resources :lift_sets, only: [:new, :create]
      end
      
      
    end
  root to: 'sessions#new'
    
    
    

  end
  get '/login', to: "sessions#new"
  post '/login', to: "sessions#create"
  delete '/login', to: "sessions#destroy"
  
end

