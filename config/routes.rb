Rails.application.routes.draw do

  get '/competitions', to: 'competitions#index'
  get '/competitions/:id', to: 'competitions#show'

  get '/teams/new', to: 'teams#new'
  post '/teams', to: 'teams#create'
end
