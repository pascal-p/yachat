Rails.application.routes.draw do
  root "welcome#about"
  
  get  '/signup', to: 'registration#new'
  post '/signup', to: 'registration#create'

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
