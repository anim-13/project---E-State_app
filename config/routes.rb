Rails.application.routes.draw do
  root to: 'users#new'
  resources :users do
    resources :estates
  end
  get '/login' => 'sessions#new'
  post '/login' => 'sessions#create'
  delete '/logout' => 'sessions#destroy'    	
end
