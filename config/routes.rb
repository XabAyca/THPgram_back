Rails.application.routes.draw do

 devise_for :users,
    defaults: { format: :json },
    path: '',
    path_names: {
      sign_in: 'api/login',
      sign_out: 'api/logout',
      registration: 'api/signup',
    },
    controllers: {
      sessions: 'sessions',
      registrations: 'registrations'
    }


  namespace :api, defaults: { format: :json } do
    namespace :v1 do
      resources :articles do
        resources :comments
      end
      resources :users, only: %i[index show]
      get '/profile', to:'profile#show'
      get '/profile/articles', to:'profile#articles'
      get '/profile/comments', to:'profile#comments'
    end
  end 
  
end
