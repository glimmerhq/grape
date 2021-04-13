Rails.application.routes.draw do
  get 'profiles/show'
  devise_for :users

  get '/login', to: 'sessions#new'

  get '/developers', to: 'documentation#index'

  get '/:user', to: 'profiles#show'

  root 'home#index'

  mount ::Status::API => '/'
end
