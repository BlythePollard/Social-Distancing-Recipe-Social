Rails.application.routes.draw do

    root 'application#home'

    resources :users do 
      resources :groups do #/users/:id/groups/:id
        resources :recipes #/users/:id/groups/:id/recipes
      end
    end

    resources :groups do
      resources :recipes
    end
    
    resources :sessions
    
end
