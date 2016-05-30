Rails.application.routes.draw do
  root "welcome#about"

  get    '/login',  to: 'session#new'
  post   '/login',  to: 'session#create'
  delete '/logout', to: 'session#destroy'

  get  '/signup', to: 'registration#new'
  post '/signup', to: 'registration#create'

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
