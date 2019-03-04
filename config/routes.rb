Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

  get '/patients', to: 'patients#show'
  post '/patients', to: 'patients#import'

  get '/payments', to: 'payments#show'
  post '/payments', to: 'payments#import'
end
