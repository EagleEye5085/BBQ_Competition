Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  get '/submissions', to: 'submissions#index'
  get '/submissions/:id', to: 'submissions#show'
  get '/teams', to: 'teams#index'
  get '/teams/new', to: 'teams#new'
  get '/teams/:id', to: 'teams#show'
  get '/teams/:team_id/submissions', to: 'team_submissions#index'
  post '/teams', to: 'teams#create'
  get '/teams/:id/edit', to: 'teams#edit'
  patch '/teams/:id', to: 'teams#update'
  get '/teams/:team_id/submissions/new', to: 'team_submissions#new'
  post '/teams/:team_id/submissions', to: 'team_submissions#create'
  get '/submissions/:id/edit', to: 'submissions#edit'
  patch '/submissions/:id', to:  'submissions#update'
end
