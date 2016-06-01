Rails.application.routes.draw do

  root "welcome#about"

  get    '/login',  to: 'sessions#new'
  post   '/login',  to: 'sessions#create'
  delete '/logout', to: 'sessions#destroy'

  get  '/signup',  to: 'registration#new'
  post '/signup',  to: 'registration#create'

  # for current_user
  get    '/profile/edit(.:format)', to: 'registration#edit', as: :profile
  put    '/profile(.:format)',      to: 'registration#update'
  patch  '/profile(.:format)',      to: 'registration#update'
  delete '/profile(.:format)',      to: 'registration#destroy'


  resources :chatrooms, param: :slug, except: [:destroy]
  resources :messages, only: :create

  # Serve websocket cable requests in-process
  mount ActionCable.server => '/cable'

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
