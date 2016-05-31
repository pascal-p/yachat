Rails.application.routes.draw do

  root "welcome#about"

  get    '/login',  to: 'sessions#new'
  post   '/login',  to: 'sessions#create'
  delete '/logout', to: 'sessions#destroy'

  get  '/signup', to: 'registration#new'
  post '/signup', to: 'registration#create'

  resources :chatrooms, param: :slug, except: [:destroy]
  resources :messages, only: :create

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
