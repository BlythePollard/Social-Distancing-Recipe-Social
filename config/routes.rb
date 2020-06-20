Rails.application.routes.draw do

    root 'application#home'

    get '/groups/addgroup' => 'groups#addgroup'
    post '/groups/addgroup' => 'groups#searchgroup'

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
