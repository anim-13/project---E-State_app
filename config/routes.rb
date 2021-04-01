Rails.application.routes.draw do
  root to: 'home#main'
  devise_for :users, controllers: {
    sessions: 'users/sessions'
  }
  
  resources :users do
    resources :estates 
    resources :addresses, except: :show
    resources :contracts, except: :show
  end
end
