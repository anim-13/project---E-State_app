Rails.application.routes.draw do
  root to: 'users#new'
  resources :users do
    resources :estates 
    resources :addresses, except: :show
    resources :contracts, except: :show
  end
  get '/login' => 'sessions#new'
  post '/login' => 'sessions#create'
  delete '/logout' => 'sessions#destroy'
end
