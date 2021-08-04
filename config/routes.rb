Rails.application.routes.draw do

  get '/competitions', to: 'competitions#index'
  get '/competitions/:id', to: 'competitions#show'
end
