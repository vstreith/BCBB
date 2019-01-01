Rails.application.routes.draw do
  devise_for :users
  root to: 'pages#home'
  get "/team" => "pages#team"
  get "/contact" => "pages#join_us"

resources :events
resources :inscriptions, only: [ :create, :destroy ]
  #Read action routes
#  get "/events" => "events#index"
#  get "/events/:id" => "events#show"
#  #Create action routes
#  get "/events/new" => "events#new"
#  post "/events" => "events#create"
  #Update action routes
#  get "/events/:id/edit" => "events#edit"
#  patch "/events/:id" => "events#update"
  #Delete action routes
#  delete "/events/:id" => "events#destroy"

end
