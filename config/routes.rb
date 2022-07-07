Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  get '/submissions', to: 'submissions#index'
  get '/teams', to: 'teams#index'
end
