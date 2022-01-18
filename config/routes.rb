Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  resources :competitions, only: [:index, :show]
  get '/competitions/:id/new', to: 'teams#new'
  post '/competitions/:id/new', to: 'teams#create'
end
