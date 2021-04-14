Rails.application.routes.draw do
  match "/404", :to => "errors#not_found", :via => :all
  
  match "/500", :to => "errors#internal_server_error", :via => :all
  
  devise_for :users

  get '/login', to: 'sessions#new'

  get '/developers', to: 'documentation#index'

  get '/profile/edit', to: 'profiles#edit'

  get '/users/:user', to: 'profiles#show'

  get '/users/:user/followers', to: 'followers#show'

  root 'home#index'

  mount ::Status::API => '/'
end
